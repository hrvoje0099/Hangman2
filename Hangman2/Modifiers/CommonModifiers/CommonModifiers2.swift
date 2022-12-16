//
// CommonModifiers2
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CommonModifiers2: ViewModifier {
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
   func setupCommonModifiers(backgroundColor: Color, isPresented: Bool) -> some View {
      self.modifier(CommonModifiers2(backgroundColor: backgroundColor, isPresented: isPresented))
   }
}
