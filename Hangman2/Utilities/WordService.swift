//
// WordService
// Hangman2
//
// Created by Hrvoje
//

import Combine
import Foundation

final class WordService {
   let network = Networking()

   func getAllEnglishWords() -> AnyPublisher<[Word], Error> {
      network.get(route: .englishWords)
   }

   func getAllCroatianWords() -> AnyPublisher<[Word], Error> {
      network.get(route: .croatianWords)
   }
}
