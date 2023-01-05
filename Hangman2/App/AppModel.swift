//
// AppModel
// Hangman2
//
// Created by Hrvoje
//

import Combine
import Foundation
import SwiftUI

final class AppModel: ObservableObject {

   // MARK: - Properties

   @Published var allWords = [Word]()
   @Published var errorMessage = ""
   @Published var showProgress = false
   @Published var showFinishGamePopup = false
   @Published var game = Game()
   @Published var letters = [Letter]()

   let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

   private var wordSubject = CurrentValueSubject<Game, Never>(Game())
   private var lettersSubject = CurrentValueSubject<[Letter], Never>([Letter]())

   private let wordService: WordService
   private var cancellables: AnyCancellable?

   @ObservedObject private var highScoreCoreData: HighScoreCoreData
   @ObservedObject private var winRateCoreData: WinRateCoreData

   // MARK: - Init

   init(wordService: WordService, highScoreCoreData: HighScoreCoreData, winRateCoreData: WinRateCoreData) {
      self.wordService = wordService
      self.highScoreCoreData = highScoreCoreData
      self.winRateCoreData = winRateCoreData
   }

   // MARK: - Words Methods

   func getAllWords() {
      if AppSettings.shared.wordsLanguage == .english {
         getAllWords(route: .englishWords)
      } else {
         getAllWords(route: .croatianWords)
      }
   }

   // MARK: - Game Methods

   func startGame() {
      let currentDifficulty = GlobalSettings.gameDifficulty
      let wordsByDifficulty = allWords.filter { $0.difficulty == currentDifficulty }
      let randomWordObject = wordsByDifficulty.randomElement()

      if let randomWordObject {
         let randomWordArray = randomWordObject.word.convertToWhitespaces().map { String($0) }
         let randomWordArrayOfTuples = randomWordArray.map { WordPart(letter: $0, isSelected: false) }

         game = Game(word: randomWordObject.word, hint: randomWordObject.hint, parts: randomWordArrayOfTuples)

         wordSubject.send(game)
         wordSubject.assign(to: &$game)
      }
   }

   func startNewGame() {
      let currentDifficulty = GlobalSettings.gameDifficulty
      let wordsByDifficulty = allWords.filter { $0.difficulty == currentDifficulty && $0.word != game.word }
      let randomWordObject = wordsByDifficulty.randomElement()

      if let randomWordObject {
         let randomWordArray = randomWordObject.word.convertToWhitespaces().map { String($0) }
         let randomWordArrayOfTuples = randomWordArray.map { WordPart(letter: $0, isSelected: false) }

         game = Game(
            word: randomWordObject.word,
            hint: randomWordObject.hint,
            parts: randomWordArrayOfTuples,
            score: game.score,
            wins: game.wins,
            losses: game.losses
         )

         wordSubject.send(game)
      }
   }

   func check(_ tappedLetter: Letter, with time: Int) {
      let gameWord = game.word
      if gameWord.contains(tappedLetter.text) {
         correctTapped(letter: tappedLetter, word: gameWord)
         checkWholeWord(with: time)
      } else {
         wrongTapped(letter: tappedLetter)
         checkIsGameOver(with: time)
      }
      tappedLetter.isDisabled = true

      wordSubject.send(game)
      lettersSubject.send(letters)
   }

   func getHangmanImage() -> String {
      "character\(game.image)"
   }

   func getHighScores() -> [HighScoreModel] {
      highScoreCoreData.highScores
   }

   func getTotalWinRate() -> Double {
      let winRates = winRateCoreData.winRateModel
      let totalWins = winRates.filter { $0.isWin }.count
      let totalGames = winRates.count
      return Double(totalWins) / Double(totalGames)
   }

   func getTotalWinRate(by difficulty: Difficulty) -> Double {
      let winRates = winRateCoreData.winRateModel
      switch difficulty {
      case .easy:
         let totalEasyWins = Double(winRates.filter { $0.isWin && $0.difficulty == 1 }.count)
         let totalEasyGames = Double(winRates.filter { $0.difficulty == 1 }.count)
         let easyWinRate = totalEasyWins / totalEasyGames
         return easyWinRate.isNaN ? 0 : easyWinRate
      case .medium:
         let totalMediumWins = Double(winRates.filter { $0.isWin && $0.difficulty == 2 }.count)
         let totalMediumGames = Double(winRates.filter { $0.difficulty == 2 }.count)
         let mediumWinRate = totalMediumWins / totalMediumGames
         return mediumWinRate.isNaN ? 0 : mediumWinRate
      case .hard:
         let totalHardWins = Double(winRates.filter { $0.isWin && $0.difficulty == 3 }.count)
         let totalHardGames = Double(winRates.filter { $0.difficulty == 3 }.count)
         let hardWinRate = totalHardWins / totalHardGames
         return hardWinRate.isNaN ? 0 : hardWinRate
      }
   }

   // MARK: - Letters Methods

   func bindLetters() {
      let wordsLanguage = AppSettings.shared.wordsLanguage

      switch wordsLanguage {
      case .english:
         let englishAlphabet = Constants.Alphabet.english
         let englishLetters = englishAlphabet.map {
            Letter(text: $0.lowercased(), isDisabled: false, status: .unselected)
         }
         letters = englishLetters
      case .croatian:
         let croatianAlphabet = Constants.Alphabet.croatian
         let croatianLetters = croatianAlphabet.map {
            Letter(text: $0.lowercased(), isDisabled: false, status: .unselected)
         }
         letters = croatianLetters
      }

      lettersSubject.send(letters)
      lettersSubject.assign(to: &$letters)
   }

   func cleanLetters() {
      letters.forEach {
         $0.status = .unselected
         $0.isDisabled = false
      }
   }

   // MARK: - Helper Game Methods

   private func correctTapped(letter tappedLetter: Letter, word gameWord: String) {
      for (index, char) in gameWord.enumerated() where String(char) == tappedLetter.text {
         let wordParts = wordSubject.value.parts
         let firstPartUpToTappedLetter = Array(wordParts.prefix(index))
         let secondPartAfterTappedLetter = Array(wordParts.dropFirst(index + 1)) // +1 to make place for tapped letter
         let partTappedLetter = [WordPart(letter: tappedLetter.text, isSelected: true)]

         // Update UI
         game.parts = firstPartUpToTappedLetter + partTappedLetter + secondPartAfterTappedLetter
         game.score += 1
         tappedLetter.status = .right
      }
   }

   private func checkWholeWord(with time: Int) {
      if game.parts.allSatisfy({ $0.isSelected }) {
         showFinishGamePopup = true

         game.isCorrectFinish = true
         game.score += 10
         game.wins += 1

         GlobalSettings.wins += 1

         highScoreCoreData.save(game, with: time)
         winRateCoreData.save(isWin: true)

         // If we didn't have a single wrong attempt during the game.
         if letters.filter({ $0.status != .unselected }).allSatisfy({ $0.status == .right }) {
            GlobalSettings.perfectWins += 1
         }

         checkLongestAndTotalTime(time)
      }
   }

   private func wrongTapped(letter tappedLetter: Letter) {
      // Update UI
      game.score -= 1
      game.image += 1
      tappedLetter.status = .wrong
   }

   private func checkIsGameOver(with time: Int) {
      if game.image > 7 {
         showFinishGamePopup = true

         game.isCorrectFinish = false
         game.score -= 5
         game.losses += 1

         GlobalSettings.losses += 1

         highScoreCoreData.save(game, with: time)
         winRateCoreData.save(isWin: false)

         checkLongestAndTotalTime(time)
      }
   }

   private func checkLongestAndTotalTime(_ time: Int) {
      let longestGame = GlobalSettings.longestGame
      if time > longestGame {
         GlobalSettings.longestGame = time
      }

      GlobalSettings.totalTime += time
   }

   // MARK: - Network Methods

   private func getAllWords(route: Route) {
      self.showProgress = true
      cancellables = wordService.getAllWords(route: route)
         .receive(on: DispatchQueue.main)
         .sink { completion in
            switch completion {
            case .failure(let error):
               print("❌ ERROR (getAllWords): \(error)")
               self.allWords = Constants.WordsMock.words
               self.errorMessage = error.localizedDescription
            case .finished:
               break
            }
            self.showProgress = false
         } receiveValue: { [weak self] allWords in
            guard let self else { return }
            self.allWords = allWords
         }
   }
}

extension Int {
   // Convert the time into day:hour:min:sec (23:34:45:56) format.
   func convertTimeToString() -> String {
      let day     = Int(self) / 86_400
      let hours   = Int(self) / 3600 % 24
      let minutes = Int(self) / 60 % 60
      let seconds = Int(self) % 60

      switch self {
      case 0..<60: return String(format: "%02is", seconds)
      case 60..<3600: return String(format: "%02im%02is", minutes, seconds)
      case 3600..<86_400: return  String(format: "%02ih%02im%02is", hours, minutes, seconds)
      default: return String(format: "%02id%02ih%02im%02is", day, hours, minutes, seconds)
      }
   }
}
