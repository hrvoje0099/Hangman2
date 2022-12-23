//
// SectionHeaderView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct SectionHeaderView: View {
   let text: LocalizedStringKey
   var withInfo = false
   var action: () -> Void = {}

   var body: some View {
      HStack {
         Text(text)
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
                  .padding([.leading, .trailing], 20)
            }
         }
      }
      .frame(height: 35)
      .background(Constants.Colors.limedSpruce)
   }
}

// MARK: - Preview

struct SectionHeaderView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         SectionHeaderView(text: Constants.LocalisedString.croatianWords)
         SectionHeaderView(text: Constants.LocalisedString.englishWords, withInfo: true)
      }
   }
}
