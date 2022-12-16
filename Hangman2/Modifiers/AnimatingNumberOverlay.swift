//
// AnimatingNumberOverlay
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct AnimatingNumberOverlay: Animatable, ViewModifier {
   var number: CGFloat
   var alignment: Alignment
   var format: String
   let textFont: Font
   let textColor: Color

   var animatableData: CGFloat {
      get {
         number
      }
      set {
         number = newValue
      }
   }

   func body(content: Content) -> some View {
      content
         .overlay(alignment: alignment) {
            Text(String(format: format, number * 100))
               .font(textFont)
               .foregroundColor(textColor)
         }
   }
}
