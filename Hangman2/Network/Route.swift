//
// Route
// Hangman2
//
// Created by Hrvoje
//

import Combine
import Foundation

protocol RouteProtocol {
   var endpoint: String { get }
   var method: HttpMethods { get }
}

enum Route: RouteProtocol {
   case englishWords
   case croatianWords

   var endpoint: String {
      switch self {
      case .englishWords: return "english_words.json"
      case .croatianWords: return "croatian_words.json"
      }
   }

   var method: HttpMethods {
      switch self {
      case .englishWords: return .GET
      case .croatianWords: return .GET
      }
   }
}
