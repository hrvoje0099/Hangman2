//
// ShapeButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ShapeButton: View {
   let text: String
   let image: String
   let action: () -> Void

   var body: some View {
      Button {
         action()
      } label: {
         ZStack(alignment: .leading) {
            Image(image)
               .padding(.leading, -25)
               .zIndex(1)

            Text(text)
               .frame(height: 40)
               .frame(maxWidth: .infinity)
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
               .background(Constants.Colors.limedSpruce)
               .cornerRadius(10)
         }
      }
   }
}

struct ShapeButton_Previews: PreviewProvider {
   static var previews: some View {
      ShapeButton(text: "test", image: Constants.Images.github) {}
         .frame(width: 150, height: 100)
   }
}
