//
// WordsPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct WordsPopupView: View {
   let action: () -> Void

   var body: some View {
      VStack {
         Text(Constants.LocalisedString.listOfAllWords)
            .font(Constants.Fonts.patrickHandL)
            .textCase(.uppercase)
            .padding(.bottom, 10)

         Divider()
            .background(Constants.Colors.dugong)

         Group {
            Text(Constants.LocalisedString.listOfAllWordsInfo)
               .postfixedWithSpacerInHStack()

            Divider()
               .background(Constants.Colors.dugong)

            Text(Constants.LocalisedString.wordColorPerDifficulty)
               .postfixedWithSpacerInHStack()
               .textCase(.uppercase)

            HStack(spacing: 0) {
               Text(Constants.LocalisedString.easy)
               Text(":").postfixedWithSpacer()
               Text(Constants.LocalisedString.green)
                  .foregroundColor(.green)
            }
            .padding(.top, -15)

            HStack(spacing: 0) {
               Text(Constants.LocalisedString.medium)
               Text(":").postfixedWithSpacer()
               Text(Constants.LocalisedString.yellow)
                  .foregroundColor(.yellow)
            }

            HStack(spacing: 0) {
               Text(Constants.LocalisedString.hard)
               Text(":").postfixedWithSpacer()
               Text(Constants.LocalisedString.red)
                  .foregroundColor(.red)
            }
         }
         .font(Constants.Fonts.patrickHandS)

         TextButton(text: Constants.LocalisedString.ok) {
            action()
         }
         .padding([.leading, .trailing], 30)
      }
      .setupCommonModifiers(width: 280, padding: 15)
      .foregroundColor(Constants.Colors.galeForce)
   }
}

// MARK: - Preview

struct WordsPopupView_Previews: PreviewProvider {
   static var previews: some View {
      WordsPopupView { }
   }
}
