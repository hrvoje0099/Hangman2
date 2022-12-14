//
// CapsuleButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

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
            .padding(.trailing, 14)
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
}

struct CapsuleButton_Previews: PreviewProvider {
   static var previews: some View {
      CapsuleButton(
         image: Constants.Images.score,
         text: "1234",
         foregroundColor: Constants.Colors.juanSan,
         backgroundColor: Constants.Colors.sanJuan
      )
   }
}
