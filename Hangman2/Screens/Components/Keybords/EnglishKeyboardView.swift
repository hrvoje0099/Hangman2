//
// EnglishKeyboardView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct EnglishKeyboardView: View {
   let geometry: GeometryProxy
   let action: (String) -> Void

   var body: some View {
      VStack(spacing: 12) {
         let screenWidth = geometry.size.width
         let padding = CGFloat(65)
         HStack(spacing: 5) {
            ForEach((0...6), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.english[index])
               } label: {
                  Text("\(Constants.Alphabet.english[index])")
                     .frame(width: (screenWidth - padding) / 7, height: 40, alignment: .center)
                     .font(Constants.Fonts.patrickHandL)
                     .background(Constants.Colors.azulPetroleo)
                     .foregroundColor(Constants.Colors.galeForce)
                     .cornerRadius(10)
                     .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((7...12), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.english[index])
               } label: {
                  Text("\(Constants.Alphabet.english[index])")
                     .frame(width: (screenWidth - padding) / 6, height: 40, alignment: .center)
                     .font(Constants.Fonts.patrickHandL)
                     .background(Constants.Colors.azulPetroleo)
                     .foregroundColor(Constants.Colors.galeForce)
                     .cornerRadius(10)
                     .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((13...19), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.english[index])
               } label: {
                  Text("\(Constants.Alphabet.english[index])")
                     .frame(width: (screenWidth - padding) / 7, height: 40, alignment: .center)
                     .font(Constants.Fonts.patrickHandL)
                     .background(Constants.Colors.azulPetroleo)
                     .foregroundColor(Constants.Colors.galeForce)
                     .cornerRadius(10)
                     .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((20...25), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.english[index])
               } label: {
                  Text("\(Constants.Alphabet.english[index])")
                     .frame(width: (screenWidth - padding) / 6, height: 40, alignment: .center)
                     .font(Constants.Fonts.patrickHandL)
                     .background(Constants.Colors.azulPetroleo)
                     .foregroundColor(Constants.Colors.galeForce)
                     .cornerRadius(10)
                     .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
               }
            }
         }
      }
      .frame(maxWidth: .infinity)
      .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
      .background(Constants.Colors.seaDeep)
   }
}

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
