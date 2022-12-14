//
// OverviewCardView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct OverviewCardView: View {
   let title: LocalizedStringKey
   let value: LocalizedStringKey
   let type: OverviewType

   var body: some View {
      HStack {
         Divider()
            .frame(minWidth: 5)
            .overlay(type.dividerColor)

         VStack(alignment: .leading) {
            Text(title)
               .font(Constants.Fonts.patrickHand3XS)
            Text(value)
               .font(Constants.Fonts.patrickHandS)
         }
      }
      .frame(width: 110, height: 50, alignment: .leading)
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

struct OverviewCardView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         OverviewCardView(title: "title", value: "value", type: .good)
         OverviewCardView(title: "title", value: "value", type: .bad)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Constants.Colors.bluewood)
   }
}
