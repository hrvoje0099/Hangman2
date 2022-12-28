//
// CapsuleButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct CapsuleButton: View {
   let image: String
   let text: String
   let foregroundColor: Color
   let backgroundColor: Color
   var action: () -> Void = {}

   var body: some View {
      HStack {
         Image(image)
            .padding(EdgeInsets(top: 3, leading: 4, bottom: 3, trailing: 0))
         Text(text)
            .frame(minWidth: calculateWidth)
            .padding(.trailing, 10)
            .font(Constants.Fonts.patrickHandXS)
            .foregroundColor(foregroundColor)
      }
      .background(backgroundColor)
      .cornerRadius(20)
      .padding(.trailing, 25)
      .onTapGesture {
         action()
      }
   }

   private var calculateWidth: CGFloat {
      let textCount = text.count
      if textCount <= 2 {                          // 10
         return 20
      } else if textCount > 2 && textCount < 6 {   // 32:10
         return 40
      } else if textCount > 5 && textCount < 9 {   // 54:32:10
         return 60
      } else {                                     // 9876:54:32:10
         return 100
      }
   }
}

// MARK: - Preview

struct CapsuleButton_Previews: PreviewProvider {
   static var previews: some View {
      CapsuleButton(
         image: Constants.Images.score,
         text: "159:59:59:59",
         foregroundColor: Constants.Colors.juanSan,
         backgroundColor: Constants.Colors.sanJuan
      )
   }
}
