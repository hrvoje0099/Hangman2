//
// ScoreColumnView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ScoreColumnView: View {
   let title: String
   let value: String
   
   var body: some View {
      VStack {
         Text(LocalizedStringKey(title))
            .font(Constants.Fonts.patrickHand2XS)
            .foregroundColor(Color.gray)
            .textCase(.uppercase)
         Text(value)
            .font(Constants.Fonts.patrickHandS)
      }
   }
}

struct ScoreColumnView_Previews: PreviewProvider {
   static var previews: some View {
      ScoreColumnView(title: "title", value: "value")
   }
}
