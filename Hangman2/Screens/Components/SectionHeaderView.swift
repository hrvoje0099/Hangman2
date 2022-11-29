//
// SectionHeaderView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct SectionHeaderView: View {
   var name: String

   var body: some View {
      Text(LocalizedStringKey(name))
         .frame(height: 35)
         .frame(maxWidth: .infinity, alignment: .leading)
         .padding([.leading, .trailing], 20)
         .font(Constants.Fonts.patrickHand)
         .foregroundColor(Constants.Colors.textColor)
         .background(Constants.Colors.stoneGranit)
         .textCase(.uppercase)
   }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
       SectionHeaderView(name: "test")
    }
}
