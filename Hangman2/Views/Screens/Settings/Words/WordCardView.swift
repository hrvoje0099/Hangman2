//
// WordCardView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct WordCardView: View {
   let word: String
   let hint: String
   let type: Difficulty

   var body: some View {
      HStack(spacing: 10) {
         Divider()
            .frame(minWidth: 5)
            .overlay(type.dividerColor)

         VStack(alignment: .leading) {
            Text(word.uppercased())
               .font(Constants.Fonts.patrickHandS)
            Text(hint)
               .font(Constants.Fonts.patrickHand3XS)
         }
      }
      .foregroundColor(Constants.Colors.galeForce)
      .frame(maxWidth: .infinity, alignment: .leading)
      .frame(height: 55)
      .background(
         LinearGradient(
            gradient: Gradient(
               colors: [type.startColor, type.endColor]
            ),
            startPoint: .leading,
            endPoint: .trailing
         )
      )
   }
}

// MARK: - Preview

struct WordsCardView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         WordCardView(word: "boca", hint: "amabalaza", type: .easy)
         WordCardView(word: "balon", hint: "zabava", type: .medium)
         WordCardView(word: "vaterpolo", hint: "sport", type: .hard)
      }
   }
}
