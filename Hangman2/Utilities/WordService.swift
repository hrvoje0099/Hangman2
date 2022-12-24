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

   func getAllWords(route: Route) -> AnyPublisher<[Word], Error> {
      network.get(route: route)
   }
}
