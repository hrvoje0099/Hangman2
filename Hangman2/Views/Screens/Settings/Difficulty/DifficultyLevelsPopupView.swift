//
// DifficultyLevelsPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct DifficultyLevelsPopupView: View {
   let action: () -> Void

   var body: some View {
      VStack {
         Text(Constants.LocalisedString.difficultyLevels)
            .font(Constants.Fonts.patrickHandL)
            .textCase(.uppercase)
            .padding(.bottom, 10)

         Divider()
            .background(Constants.Colors.dugong)

         Group {
            Text(Constants.LocalisedString.chooseDifficulty)
               .postfixedWithSpacerInHStack()

            Divider()
               .background(Constants.Colors.dugong)

            Text(Constants.LocalisedString.wordLengthPerLevel)
               .postfixedWithSpacerInHStack()
               .textCase(.uppercase)

            HStack(spacing: 0) {
               Text(Constants.LocalisedString.easy)
               Text(":").postfixedWithSpacer()
               Text(Constants.LocalisedString.easyDifficultyLength)
            }
            .padding(.top, -15)

            HStack(spacing: 0) {
               Text(Constants.LocalisedString.medium)
               Text(":").postfixedWithSpacer()
               Text(Constants.LocalisedString.mediumDifficultyLength)
            }

            HStack(spacing: 0) {
               Text(Constants.LocalisedString.hard)
               Text(":").postfixedWithSpacer()
               Text(Constants.LocalisedString.hardDifficultyLength)
            }
         }
         .font(Constants.Fonts.patrickHandS)

         TextButton(text: Constants.LocalisedString.ok) {
            action()
         }
      }
      .frame(width: 280)
      .padding()
      .foregroundColor(Constants.Colors.galeForce)
      .background(Constants.Colors.seaDeep)
      .cornerRadius(10)
      .shadow(color: Constants.Colors.blackBox, radius: 5, x: 0, y: 0)
   }
}

struct DifficultyLevelsPopupView_Previews: PreviewProvider {
   static var previews: some View {
      DifficultyLevelsPopupView {}
         .environment(\.locale, .init(identifier: "hr"))
         .preferredColorScheme(.dark)
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
         .previewDisplayName("iPhone 14 Pro")

      DifficultyLevelsPopupView {}
         .environment(\.locale, .init(identifier: "en"))
         .preferredColorScheme(.light)
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
   }
}
