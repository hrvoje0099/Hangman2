//
// Letter
// Hangman2
//
// Created by Hrvoje
//

import Foundation
import SwiftUI

final class Letter: ObservableObject, Identifiable {
   let id = UUID()
   var text: String
   var isDisabled: Bool
   var status: LetterStatus

   init(text: String, isDisabled: Bool, status: LetterStatus) {
      self.text = text
      self.isDisabled = isDisabled
      self.status = status
   }
}

enum LetterStatus: Int {
   case unselected   = 1
   case right        = 2
   case wrong        = 3

   var color: Color {
      switch self {
      case .unselected: return Constants.Colors.azulPetroleo
      case .right: return .green
      case .wrong: return .red
      }
   }
}
