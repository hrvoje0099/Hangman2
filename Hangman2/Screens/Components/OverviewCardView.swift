//
// OverviewCardView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct OverviewCardView: View {
   let title: String
   let value: String
   var dividerColor = Constants.Colors.mintLeaf
   var startColor = Constants.Colors.azulPetroleo
   var endColor = Constants.Colors.bluewood

   var body: some View {
      HStack {
         Divider()
            .frame(minWidth: 5)
            .overlay(dividerColor)

         VStack(alignment: .leading) {
            Text(LocalizedStringKey(title))
               .font(Constants.Fonts.patrickHand3XS)
            Text(LocalizedStringKey(value))
               .font(Constants.Fonts.patrickHandS)
         }
      }
      .frame(width: 110, height: 50, alignment: .leading)
      .background(
         LinearGradient(
            gradient: Gradient(
               colors: [startColor, endColor]
            ),
            startPoint: .leading,
            endPoint: .trailing
         )
      )
   }
}

struct OverviewCardView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         OverviewCardView(title: "title", value: "value")
         OverviewCardView(
            title: "title",
            value: "value",
            dividerColor: Constants.Colors.carnation,
            startColor: Constants.Colors.carnation.opacity(0.3),
            endColor: Constants.Colors.bluewood
         )
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Constants.Colors.bluewood)

   }
}
