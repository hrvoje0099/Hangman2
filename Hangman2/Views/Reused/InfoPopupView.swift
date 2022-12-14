//
// InfoPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct InfoPopupView: View {
   let text: LocalizedStringKey
   let action: () -> Void

   var body: some View {
      VStack(spacing: 0) {
         Text(Constants.LocalisedString.info)
            .font(Constants.Fonts.patrickHandL)
            .textCase(.uppercase)

         Divider()
            .background(Constants.Colors.dugong)
            .padding(.top, 10)

         Text(text)
            .font(Constants.Fonts.patrickHandS)
            .padding([.top, .bottom], 10)

         TextButton(text: Constants.LocalisedString.ok, maxWidth: 150) {
            action()
         }
      }
      .frame(width: 240)
      .padding()
      .foregroundColor(Constants.Colors.galeForce)
      .background(Constants.Colors.seaDeep)
      .cornerRadius(10)
      .shadow(color: Constants.Colors.blackBox, radius: 5, x: 0, y: 0)
   }
}

struct InfoPopupView_Previews: PreviewProvider {
    static var previews: some View {
       InfoPopupView(text: Constants.LocalisedString.winRateInfo) {}
          .environment(\.locale, .init(identifier: "hr"))
    }
}
