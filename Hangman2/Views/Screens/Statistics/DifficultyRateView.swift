//
// DifficultyRateView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct DifficultyRateView: View {
   let difficultyName: LocalizedStringKey
   let rateValue: CGFloat
   var textFont = Constants.Fonts.patrickHand2XS

   @State private var rateState = CGFloat(0)

   var body: some View {
      HStack {
         Text(difficultyName)
         Spacer()
            .modifier(
               AnimatingNumberOverlay(
                  number: rateState,
                  alignment: .trailing,
                  format: "%.f%%",
                  textFont: textFont,
                  textColor: .primary
               )
            )
      }
      .font(textFont)
      .onAppear {
         withAnimation(.easeInOut(duration: 3)) {
            rateState = rateValue
         }
      }
   }
}

// MARK: - Preview

struct DifficultyRateView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyEasy, rateValue: 1.00)
         DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyMedium, rateValue: 0.54)
         DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyHard, rateValue: 0.25)
      }
   }
}
