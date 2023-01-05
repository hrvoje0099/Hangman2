//
// GameInfoPopupView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct GameInfoPopupView: View {
   let isCorrectFinish: Bool
   var word: String = ""
   let action: () -> Void

   var body: some View {
      VStack {
         Text(isCorrectFinish ? Constants.LocalisedString.bravo :Constants.LocalisedString.gameOver)
            .font(Constants.Fonts.dangerXL)
            .textCase(.uppercase)

         if !isCorrectFinish {
            HStack {
               Text(Constants.LocalisedString.hiddenWord)
               Text("\(word)")
            }
            .font(Constants.Fonts.patrickHand)

            Text(Constants.LocalisedString.betterLuckNextTime)
               .font(Constants.Fonts.patrickHand2XS)
         } else {
            Text(Constants.LocalisedString.youFoundCorrectWord)
               .font(Constants.Fonts.patrickHand)
         }

         TextButton(
            text: Constants.LocalisedString.newGame,
            font: Constants.Fonts.dangerL,
            isActionEnabled: true
         ) {
            action()
         }
      }
      .setupCommonModifiers(width: 250, padding: 25)
   }
}

// MARK: - Preview

struct GameInfoPopupView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         GameInfoPopupView(isCorrectFinish: false, word: "DOOR") {}
         GameInfoPopupView(isCorrectFinish: true) {}
      }
   }
}
