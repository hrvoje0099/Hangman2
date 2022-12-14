//
// ConfirmPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct ConfirmPopupView: View {
   let action: (Bool) -> Void

   var body: some View {
      VStack(spacing: 0) {
         Group {
            Text(Constants.LocalisedString.quitTheGame)
               .font(Constants.Fonts.patrickHandL)
            Text(Constants.LocalisedString.exitWillLoseGameProgress)
               .font(Constants.Fonts.patrickHandS)
         }
         .foregroundColor(Constants.Colors.galeForce)

         HStack(spacing: 20) {
            TextButton(
               text: Constants.LocalisedString.yes,
               backgroundColor: Constants.Colors.riverBed,
               shadowColor: Constants.Colors.ebonyClaySolo
            ) {
               action(true)
            }
            TextButton(text: Constants.LocalisedString.no) {
               action(false)
            }
         }
      }
      .frame(width: 305)
      .padding()
      .background(Constants.Colors.seaDeep)
      .cornerRadius(10)
      .shadow(color: Constants.Colors.blackBox, radius: 5, x: 0, y: 0)
   }
}

// MARK: - Preview

struct ConfirmPopupView_Previews: PreviewProvider {
   static var previews: some View {
      ConfirmPopupView { _ in }
   }
}
