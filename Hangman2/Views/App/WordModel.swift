//
// WordModel
// Hangman2
//
// Created by Hrvoje
//

import Combine
import Foundation

final class WordModel: ObservableObject {

   // MARK: - Properties

   @Published var allWords: [Word] = []
   @Published var errorMessage = ""
   @Published var showProgress = true

   private let wordService: WordService
   private var cancellables = Set<AnyCancellable>()

   // MARK: - Init

   init(wordService: WordService) {
      self.wordService = wordService
   }

   // MARK: - Public Methods

   func getAllWords() {
      if AppSettings.shared.wordsLanguage == .english {
         getAllWords(route: .englishWords)
      } else {
         getAllWords(route: .croatianWords)
      }
   }

   func getRandomWord() -> Word? {
      let currentDifficulty = GlobalSettings.gameDifficulty
      let wordsByDifficulty = allWords.filter { $0.difficulty == currentDifficulty.rawValue }
      return wordsByDifficulty.randomElement()
   }

   // MARK: - Helper Methods

   private func getAllWords(route: Route) {
      self.showProgress = true
      wordService.getAllWords(route: route)
         .receive(on: DispatchQueue.main)
         .sink { completion in
            switch completion {
            case .failure(let error):
               print("❌ ERROR (getAllWords): \(error)")
               self.allWords = Constants.WordsMock.words
               self.errorMessage = error.localizedDescription
            case .finished: break
            }
            self.showProgress = false
         } receiveValue: { [weak self] englishWords in
            guard let self else { return }
            self.allWords = englishWords
         }
         .store(in: &cancellables)
   }
}
