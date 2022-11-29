//
// ShapeButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ShapeButton: View {
   var text: String
   var image: String
   var action: () -> Void
   
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
                .font(Constants.Fonts.patrickHand)
                .foregroundColor(Constants.Colors.textColor)
                .background(Constants.Colors.stoneGranit)
                .cornerRadius(10)
          }
       }
    }
}

struct ShapeButton_Previews: PreviewProvider {
    static var previews: some View {
       ShapeButton(text: "test", image: Constants.Images.github) {

       }
       .frame(width: 150, height: 100)
    }
}
