//
// TextButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct TextButton: View {
   let text: LocalizedStringKey
   var font = Constants.Fonts.patrickHandXS
   var textColor = Color.white
   var backgroundColor = Constants.Colors.carnation
   var isShadowVisible = true
   var shadowColor = Constants.Colors.carmine
   var maxWidth = CGFloat.infinity
   var insidePadding = CGFloat(10)
   var outsidePadding = CGFloat(10)
   var isActionEnabled = true
   var action: () -> Void = {}

   var body: some View {
      Group {
         Text(text)
            .padding([.top, .bottom], insidePadding)
            .font(font)
            .frame(maxWidth: maxWidth)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(15)
            .if(isShadowVisible) { view in
               view.shadow(color: shadowColor, radius: 0, x: 0, y: 5)
            }
            .if(isActionEnabled) { view in
               view.onTapGesture {
                  action()
               }
            }
      }
      .padding([.top, .bottom], outsidePadding)
   }
}

struct TextButton_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         // swiftlint:disable: line_length
         TextButton(text: Constants.LocalisedString.play, font: Constants.Fonts.dangerXL, textColor: Constants.Colors.galeForce, backgroundColor: Constants.Colors.carnation)
         TextButton(text: Constants.LocalisedString.twoPlayers, font: Constants.Fonts.patrickHand3XL, textColor: Constants.Colors.galeForce, backgroundColor: Constants.Colors.blueHeath)
      }
   }
}
