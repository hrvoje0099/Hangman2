//
// DifficultyRateView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct DifficultyRateView: View {
   let difficultyName: String
   let rateValue: Int

   var body: some View {
      HStack {
         Text(LocalizedStringKey(difficultyName))
            .font(Constants.Fonts.patrickHand2XS)
         Spacer()
         #warning("Hardcode")
         Text("\(rateValue)%")
            .font(Constants.Fonts.patrickHand2XS)
      }
   }
}

struct DifficultyRateView_Previews: PreviewProvider {
   static var previews: some View {
      DifficultyRateView(difficultyName: "easy", rateValue: 77)
   }
}
