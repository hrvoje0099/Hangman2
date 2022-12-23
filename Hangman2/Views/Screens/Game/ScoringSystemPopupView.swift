//
// ScoringSystemPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct ScoringSystemPopupView: View {
   let action: () -> Void

   var body: some View {
      VStack(spacing: 0) {
         Text(Constants.LocalisedString.scoringSystem)
            .font(Constants.Fonts.patrickHandL)
            .textCase(.uppercase)

         Divider()
            .background(Constants.Colors.dugong)
            .padding(.top, 10)

         Group {
            TextRow(prefixText: Constants.LocalisedString.rightLetter, postfixText: "+1").padding(.top, 15)
            TextRow(prefixText: Constants.LocalisedString.wrongLetter, postfixText: "-1")
            TextRow(prefixText: Constants.LocalisedString.gameWin, postfixText: "+10")
            TextRow(prefixText: Constants.LocalisedString.gameLost, postfixText: "-5")
         }
         .font(Constants.Fonts.patrickHandS)

         TextButton(text: Constants.LocalisedString.ok) {
            action()
         }
      }
      .setupCommonModifiers(width: 210, padding: 15)
      .foregroundColor(Constants.Colors.galeForce)
   }
}

// MARK: - View Parts

private struct TextRow: View {
   let prefixText: LocalizedStringKey
   let postfixText: String

   var body: some View {
      HStack {
         Text(prefixText)
         Spacer()
         Text(postfixText)
      }
   }
}

// MARK: - Preview

struct ScoringSystemPopupView_Previews: PreviewProvider {
   static var previews: some View {
      ScoringSystemPopupView {}
         .environment(\.locale, .init(identifier: "hr"))
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
         .previewDisplayName("iPhone 14 Pro")

      ScoringSystemPopupView {}
         .environment(\.locale, .init(identifier: "en"))
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
   }
}
