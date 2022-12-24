//
// Difficulty
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

enum Difficulty: Int, Codable {
   case easy   = 1   // up to max 4 letters
   case medium = 2   // from 5 to max 7 letters"
   case hard   = 3   // from 8 to max 11 letters

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
