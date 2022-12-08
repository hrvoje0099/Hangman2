//
// ScoringSystemView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ScoringSystemView: View {
   let action: () -> Void

   var body: some View {
      VStack(spacing: 0) {
         Text("Scoring System")
            .font(Constants.Fonts.patrickHandL)
            .foregroundColor(Constants.Colors.galeForce)
            .textCase(.uppercase)

         Divider()
            .background(Constants.Colors.dugong)
            .padding([.top, .bottom], 10)

         HStack {
            Text("Right Letter")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("+1")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         HStack {
            Text("Wrong Letter")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("-1")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         HStack {
            Text("Game Win")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("+10")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         HStack {
            Text("Game Lost")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
            Spacer()
            Text("-5")
               .font(Constants.Fonts.patrickHandS)
               .foregroundColor(Constants.Colors.galeForce)
         }

         TextButton(text: "OK", font: Constants.Fonts.patrickHandXS, color: Constants.Colors.carnation, textColor: Constants.Colors.galeForce)
            .padding(.top, 20)
            .padding(.bottom, 0)
            .shadow(color: Constants.Colors.carmine, radius: 0, x: 0, y: 5)
            .onTapGesture {
               action()
            }
      }
      .frame(width: 200)
      .padding()
      .background(Constants.Colors.seaDeep)
      .cornerRadius(10)
   }
}

struct ScoringSystemView_Previews: PreviewProvider {
   static var previews: some View {
      ScoringSystemView() {}
   }
}
