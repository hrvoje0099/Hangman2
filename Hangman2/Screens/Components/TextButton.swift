//
// TextButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct TextButton: View {
   let text: String
   let font: Font
   var color: Color?
   var textColor: Color?

   var body: some View {
      Text(LocalizedStringKey(text))
         .padding([.top, .bottom], 7)
         .font(font)
         .frame(maxWidth: .infinity)
         .foregroundColor(textColor ?? Constants.Colors.galeForce)
         .background(color ?? Color.accentColor)
         .cornerRadius(15)
   }
}

struct TextButton_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         // swiftlint:disable: line_length
         TextButton(text: Constants.LocalisedString.play, font: Constants.Fonts.dangerXL, color: Constants.Colors.carnation)
         TextButton(text: Constants.LocalisedString.twoPlayers, font: Constants.Fonts.patrickHand3XL)
      }
   }
}
