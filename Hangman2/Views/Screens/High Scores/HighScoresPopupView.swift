//
// HighScoresPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct HighScoresPopupView: View {
   let action: () -> Void

   var body: some View {
      VStack {
         Text(Constants.LocalisedString.highScores)
            .font(Constants.Fonts.patrickHandL)
            .textCase(.uppercase)

         Divider()
            .background(Constants.Colors.dugong)
            .padding(.top, -10)

         Group {
            Text(Constants.LocalisedString.yourTopHighScores)
            Text(Constants.LocalisedString.dashDateOfPlaying).postfixedWithSpacerInHStack()
            Text(Constants.LocalisedString.dashTotalScore).postfixedWithSpacerInHStack()
            Text(Constants.LocalisedString.dashWinLoseRatio).postfixedWithSpacerInHStack()
            Text(Constants.LocalisedString.dashDifficultyLevel).postfixedWithSpacerInHStack()
            Text(Constants.LocalisedString.dashTotalPlayingTime).postfixedWithSpacerInHStack()
         }
         .font(Constants.Fonts.patrickHandS)

         TextButton(text: Constants.LocalisedString.ok) {
            action()
         }
      }
      .setupWithCommonModifiers(width: 230, padding: 15)
      .foregroundColor(Constants.Colors.galeForce)
   }
}

// MARK: - Preview

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
