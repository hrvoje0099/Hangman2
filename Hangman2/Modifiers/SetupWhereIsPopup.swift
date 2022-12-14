//
// SetupWhereIsPopup
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct SetupWhereIsPopup: ViewModifier {
   var backgroundColor: Color
   var isPresented: Bool

   func body(content: Content) -> some View {
      content
         .background(backgroundColor)
         .navigationBarBackButtonHidden()
         .blur(radius: isPresented ? 3 : 0)
         .disabled(isPresented)
   }
}

extension View {
   func groupedViewSetupWhereIsPopup(backgroundColor: Color, isPresented: Bool) -> some View {
      self.modifier(SetupWhereIsPopup(backgroundColor: backgroundColor, isPresented: isPresented))
   }
}
