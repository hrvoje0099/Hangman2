//
// EnglishKeyboardView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct EnglishKeyboardView: View {
   let geometry: GeometryProxy
   let action: (Letter) -> Void

   @EnvironmentObject private var appModel: AppModel

   var body: some View {
      VStack(spacing: 12) {
         if appModel.letters.count == Constants.Alphabet.english.count {
            let screenWidth = geometry.size.width
            let padding = CGFloat(65)

            HStack(spacing: 5) {
               ForEach(appModel.letters[0...6]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 7)) {
                     action(letter)
                  }
               }
            }

            HStack(spacing: 5) {
               ForEach(appModel.letters[7...12]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 6)) {
                     action(letter)
                  }
               }
            }

            HStack(spacing: 5) {
               ForEach(appModel.letters[13...19]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 7)) {
                     action(letter)
                  }
               }
            }

            HStack(spacing: 5) {
               ForEach(appModel.letters[20...25]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 6)) {
                     action(letter)
                  }
               }
            }
         }
      }
      .frame(maxWidth: .infinity)
      .padding(10)
      .background(Constants.Colors.seaDeep)
      .font(Constants.Fonts.patrickHandL)
      .foregroundColor(Constants.Colors.galeForce)
   }
}
