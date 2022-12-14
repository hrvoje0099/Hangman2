//
// Difficulty
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

enum Difficulty: Int, Codable {
   case easy
   case medium
   case hard

   var localised: LocalizedStringKey {
      switch self {
      case .easy:
         return Constants.LocalisedString.easy
      case .medium:
         return Constants.LocalisedString.medium
      case .hard:
         return Constants.LocalisedString.hard
      }
   }
}
