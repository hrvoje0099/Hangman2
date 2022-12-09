//
// HighScoresPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct HighScoresPopupView: View {
   let action: () -> Void

   var body: some View {
      VStack {
         Text(LocalizedStringKey(Constants.LocalisedString.highScores))
            .font(Constants.Fonts.patrickHandL)
            .foregroundColor(Constants.Colors.galeForce)
            .textCase(.uppercase)

         Divider()
            .background(Constants.Colors.dugong)
            .padding(.top, -10)

         Text(LocalizedStringKey(Constants.LocalisedString.yourTopHighScores))
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.dashDateOfPlaying))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
         }

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.dashTotalScore))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
         }

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.dashWinLoseRatio))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
         }

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.dashDifficultyLevel))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
         }

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.dashTotalPlayingTime))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
         }

         TextButton(
            text: Constants.LocalisedString.ok,
            font: Constants.Fonts.patrickHandXS,
            color: Constants.Colors.carnation,
            textColor: Constants.Colors.galeForce
         )
         .padding(.top, 20)
         .padding(.bottom, 0)
         .shadow(color: Constants.Colors.carmine, radius: 0, x: 0, y: 5)
         .onTapGesture {
            action()
         }
      }
      .frame(width: 230)
      .padding()
      .background(Constants.Colors.seaDeep)
      .cornerRadius(10)
      .shadow(color: Constants.Colors.blackBox, radius: 5, x: 0, y: 0)
   }
}

struct HighScoresPopupView_Previews: PreviewProvider {
   static var previews: some View {
      HighScoresPopupView {}
         .environment(\.locale, .init(identifier: "hr"))
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
         .previewDisplayName("iPhone 14 Pro")

      HighScoresPopupView {}
         .environment(\.locale, .init(identifier: "en"))
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
   }
}
