//
// Language
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

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

   var localised: LocalizedStringKey {
      switch self {
      case .english:
         return Constants.LocalisedString.english
      case .croatian:
         return Constants.LocalisedString.croatian
      }
   }
}
