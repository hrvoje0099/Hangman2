//
// CommonModifiers2
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CommonModifiers2: ViewModifier {
   var backgroundColor: Color
   var blurValue: CGFloat
   var isPresented: Bool

   func body(content: Content) -> some View {
      content
         .background(backgroundColor)
         .navigationBarBackButtonHidden()
         .blur(radius: isPresented ? blurValue : 0)
         .disabled(isPresented)
   }
}

extension View {
   func setupCommonModifiers(backgroundColor: Color, blurValue: CGFloat = 4, isPresented: Bool) -> some View {
      self.modifier(CommonModifiers2(backgroundColor: backgroundColor, blurValue: blurValue, isPresented: isPresented))
   }
}
