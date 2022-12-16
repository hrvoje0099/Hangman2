//
// CommonModifiers1
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CommonModifiers1: ViewModifier {
   var width: CGFloat
   var padding: CGFloat
   var backgroundColor: Color
   var cornerRadius: CGFloat

   func body(content: Content) -> some View {
      content
         .frame(width: width)
         .padding(padding)
         .background(backgroundColor)
         .cornerRadius(cornerRadius)
         .shadow(color: Constants.Colors.blackBox, radius: 5, x: 0, y: 0)
   }
}

extension View {
   func setupCommonModifiers(width: CGFloat, padding: CGFloat, backgroundColor: Color = Constants.Colors.seaDeep, cornerRadius: CGFloat = 10) -> some View {
      self.modifier(CommonModifiers1(width: width, padding: padding, backgroundColor: backgroundColor, cornerRadius: cornerRadius))
   }
}
