//
// View+PostfixedSpacer
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

extension View {
   func postfixedWithSpacer() -> some View {
      Group {
         self
         Spacer()
      }
   }
}

extension Text {
   func postfixedWithSpacerInHStack() -> some View {
      HStack {
         self
         Spacer()
      }
   }
}
