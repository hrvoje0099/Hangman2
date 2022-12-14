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
   let rateValue: Int
   var textFont = Constants.Fonts.patrickHand2XS

   var body: some View {
      HStack {
         Text(difficultyName)
         Spacer()
         Text("\(rateValue)%")
      }
      .font(textFont)
   }
}

// MARK: - Preview

struct DifficultyRateView_Previews: PreviewProvider {
   static var previews: some View {
      DifficultyRateView(difficultyName: "easy", rateValue: 77)
   }
}
