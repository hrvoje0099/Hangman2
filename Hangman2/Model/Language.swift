//
// Language
// Hangman2
//
// Created by Hrvoje
//

import Foundation

enum Language: Int, Codable {
   case english
   case croatian

   var location: String {
      switch self {
      case .english:
         return "en"
      case .croatian:
         return "hr"
      }
   }

   var localised: String {
      switch self {
      case .english:
         return Constants.LocalisedString.english
      case .croatian:
         return Constants.LocalisedString.croatian
      }
   }
}
