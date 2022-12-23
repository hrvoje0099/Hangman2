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
   @Published var errorMessage: String = ""
   let wordService: WordService
   
   private var cancellables = Set<AnyCancellable>()
   
   // MARK: - Init
   
   init(wordService: WordService) {
      self.wordService = wordService
   }
   
   // MARK: - Public Methods
   
   func getAllWords() {
      if AppSettings.shared.wordsLanguage == .english {
         getAllEnglishWords()
      } else {
         getAllCroatianWords()
      }
   }
   
   func getRandomWord() -> Word? {
      let currentDifficulty = GlobalSettings.gameDifficulty
      let wordsByDifficulty = allWords.filter { $0.difficulty == currentDifficulty.rawValue }
      return wordsByDifficulty.randomElement()
   }
   
   // MARK: - Helper Methods
   
   private func getAllEnglishWords() {
      wordService.getAllEnglishWords()
         .receive(on: DispatchQueue.main)
         .sink { completion in
            switch completion {
            case .failure(let error):
               print("❌ ERROR (getEnglishWords): \(error)")
               self.errorMessage = error.localizedDescription
            case .finished: break
            }
         } receiveValue: { [weak self] englishWords in
            guard let self else { return }
            self.allWords = englishWords
         }
         .store(in: &cancellables)
   }
   
   private func getAllCroatianWords() {
      wordService.getAllCroatianWords()
         .receive(on: DispatchQueue.main)
         .sink { completion in
            switch completion {
            case .failure(let error):
               print("❌ ERROR (getEnglishWords): \(error)")
               self.errorMessage = error.localizedDescription
            case .finished: break
            }
         } receiveValue: { [weak self] croatianWords in
            guard let self else { return }
            self.allWords = croatianWords
         }
         .store(in: &cancellables)
   }
}
