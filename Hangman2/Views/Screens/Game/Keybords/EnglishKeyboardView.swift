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
   let action: (String) -> Void

   var body: some View {
      VStack(spacing: 12) {
         let screenWidth = geometry.size.width
         let padding = CGFloat(65)
         HStack(spacing: 5) {
            ForEach((0...6), id: \.self) { index in
               CharBox(text: "\(Constants.Alphabet.english[index])", width: abs((screenWidth - padding) / 7)) {
                  action(Constants.Alphabet.english[index])
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((7...12), id: \.self) { index in
               CharBox(text: "\(Constants.Alphabet.english[index])", width: abs((screenWidth - padding) / 6)) {
                  action(Constants.Alphabet.english[index])
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((13...19), id: \.self) { index in
               CharBox(text: "\(Constants.Alphabet.english[index])", width: abs((screenWidth - padding) / 7)) {
                  action(Constants.Alphabet.english[index])
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((20...25), id: \.self) { index in
               CharBox(text: "\(Constants.Alphabet.english[index])", width: abs((screenWidth - padding) / 6)) {
                  action(Constants.Alphabet.english[index])
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

// MARK: - Preview

struct EnglishKeyboardView_Previews: PreviewProvider {
   static var previews: some View {
      GeometryReader { geometry in
         VStack {
            Spacer()
            EnglishKeyboardView(geometry: geometry) { char in
               print(char)
            }
         }
      }
   }
}
