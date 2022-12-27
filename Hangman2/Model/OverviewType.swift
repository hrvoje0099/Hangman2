//
// OverviewType
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

enum OverviewType {
   case good
   case bad

   var dividerColor: Color {
      switch self {
      case .good: return Constants.Colors.mintLeaf
      case .bad: return Constants.Colors.carnation
      }
   }

   var startColor: Color {
      switch self {
      case .good: return Constants.Colors.azulPetroleo
      case .bad: return Constants.Colors.carnation.opacity(0.2)
      }
   }

   var endColor: Color {
      switch self {
      case .good: return Constants.Colors.bluewood
      case .bad: return Constants.Colors.bluewood
      }
   }
}
