//
// SectionHeaderView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct SectionHeaderView: View {
   let name: String
   var withInfo: Bool = false
   var action: () -> Void = {}

   var body: some View {
      HStack {
         Text(LocalizedStringKey(name))
            .frame(height: 35)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .trailing], 20)
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)
            .textCase(.uppercase)

         if withInfo {
            Button {
               action()
            } label: {
               Image(Constants.Images.info)
            }
            .padding(.trailing, 20)
         }
      }
      .background(Constants.Colors.limedSpruce)
   }
}

struct SectionHeaderView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         SectionHeaderView(name: "CROATIAN_WORDS")
         SectionHeaderView(name: "\(GlobalSettings.wordsLanguage.localised)_WORDS", withInfo: true)
      }
   }
}
