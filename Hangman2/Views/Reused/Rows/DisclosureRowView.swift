//
// DisclosureRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct DisclosureRowView: View {
   let title: LocalizedStringKey
   var trailingText: LocalizedStringKey?

   var body: some View {
      HStack {
         Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHand)
            .foregroundColor(Constants.Colors.galeForce)

         HStack {
            Text(trailingText ?? "")
               .foregroundColor(Constants.Colors.watermelon)
               .font(Constants.Fonts.patrickHandS)
            Image((trailingText != nil) ? Constants.Images.forwardRed : Constants.Images.forward)
               .resizable()
               .frame(width: 6, height: 12, alignment: .center)
         }
      }
      .frame(height: 55)
      .padding([.leading, .trailing], 20)
      .background(Constants.Colors.seaDeep)
   }
}

struct DisclosureRowView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         DisclosureRowView(title: "test")
         DisclosureRowView(title: "test", trailingText: "english")
      }
   }
}
