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
         Text(LocalizedStringKey(Constants.LocalisedString.difficultyLevels))
            .font(Constants.Fonts.patrickHandL)
            .foregroundColor(Constants.Colors.galeForce)
            .textCase(.uppercase)
            .padding(.bottom, 10)

         Divider()
            .background(Constants.Colors.dugong)

         HStack(spacing: 0) {
            Text(LocalizedStringKey(Constants.LocalisedString.chooseDifficulty))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
         }
         .padding([.top, .bottom], 10)

         Divider()
            .background(Constants.Colors.dugong)

         HStack(spacing: 0) {
            Text(LocalizedStringKey(Constants.LocalisedString.wordLengthPerLevel))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
               .textCase(.uppercase)
            Spacer()
         }
         .padding(.top, 5)

         HStack(spacing: 0) {
            Text(LocalizedStringKey(Constants.LocalisedString.easy))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Text(":")
            Spacer()
            Text(LocalizedStringKey(Constants.LocalisedString.easyDifficultyLength))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }
         .padding(.top, -15)

         HStack(spacing: 0) {
            Text(LocalizedStringKey(Constants.LocalisedString.medium))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Text(":")
            Spacer()
            Text(LocalizedStringKey(Constants.LocalisedString.mediumDifficultyLength))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         HStack(spacing: 0) {
            Text(LocalizedStringKey(Constants.LocalisedString.hard))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Text(":")
            Spacer()
            Text(LocalizedStringKey(Constants.LocalisedString.hardDifficultyLength))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         TextButton(
            text: Constants.LocalisedString.ok,
            font: Constants.Fonts.patrickHandXS,
            color: Constants.Colors.carnation,
            textColor: Constants.Colors.galeForce
         )
         .padding(.top, 10)
         .padding(.bottom, 10)
         .shadow(color: Constants.Colors.carmine, radius: 0, x: 0, y: 5)
         .onTapGesture {
            action()
         }
      }
      .frame(width: 280)
      .padding()
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
