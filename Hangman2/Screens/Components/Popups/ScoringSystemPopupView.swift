//
// ScoringSystemPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ScoringSystemPopupView: View {
   let action: () -> Void

   var body: some View {
      VStack(spacing: 0) {
         Text(LocalizedStringKey(Constants.LocalisedString.scoringSystem))
            .font(Constants.Fonts.patrickHandL)
            .foregroundColor(Constants.Colors.galeForce)
            .textCase(.uppercase)

         Divider()
            .background(Constants.Colors.dugong)
            .padding(.top, 10)

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.rightLetter))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("+1")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }
         .padding(.top, 15)

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.wrongLetter))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("-1")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.gameWin))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("+10")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         HStack {
            Text(LocalizedStringKey(Constants.LocalisedString.gameLost))
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("-5")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
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
      .frame(width: 210)
      .padding()
      .background(Constants.Colors.seaDeep)
      .cornerRadius(10)
      .shadow(color: Constants.Colors.blackBox, radius: 5, x: 0, y: 0)
   }
}

struct ScoringSystemView_Previews: PreviewProvider {
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
