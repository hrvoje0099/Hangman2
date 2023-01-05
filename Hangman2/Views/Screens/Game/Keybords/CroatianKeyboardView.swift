//
// CroatianKeyboardView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct CroatianKeyboardView: View {
   let geometry: GeometryProxy
   let action: (Letter) -> Void

   @EnvironmentObject private var appModel: AppModel

   var body: some View {
      VStack(spacing: 12) {
         if appModel.letters.count == Constants.Alphabet.croatian.count {
            let screenWidth = geometry.size.width
            let padding = CGFloat(65)

            HStack(spacing: 5) {
               ForEach(appModel.letters[0...7]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 8)) {
                     action(letter)
                  }
               }
            }

            HStack(spacing: 5) {
               ForEach(appModel.letters[8...14]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 8)) {
                     action(letter)
                  }
               }
            }

            HStack(spacing: 5) {
               ForEach(appModel.letters[15...22]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 8)) {
                     action(letter)
                  }
               }
            }

            HStack(spacing: 5) {
               ForEach(appModel.letters[23...29]) { letter in
                  CharBox(letter: letter, width: abs((screenWidth - padding) / 8)) {
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

// MARK: - Preview

struct CroatianKeyboardView_Previews: PreviewProvider {
   static var previews: some View {
      GeometryReader { geometry in
         VStack {
            Spacer()
            CroatianKeyboardView(geometry: geometry) { char in
               print(char)
            }
         }
      }
   }
}

/*
 Verzija sa tri reda:

 struct Cro3: View {
    let geometry: GeometryProxy

    var body: some View {
       VStack(spacing: 12) {
          let screenWidth = geometry.size.width
          let padding = CGFloat(65)
          HStack(spacing: 5) {
             ForEach((0...9), id: \.self) {
                Text("\(Constants.Alphabet.croatian[$0])")
                   .frame(width: (screenWidth - padding) / 10, height: 40, alignment: .center)
                   .font(Constants.Fonts.patrickHandL)
                   .background(Constants.Colors.azulPetroleo)
                   .foregroundColor(Constants.Colors.galeForce)
                   .cornerRadius(10)
                   .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
             }
          }

          HStack(spacing: 5) {
             ForEach((10...19), id: \.self) {
                Text("\(Constants.Alphabet.croatian[$0])")
                   .frame(width: (screenWidth - padding) / 10, height: 40, alignment: .center)
                   .font(Constants.Fonts.patrickHandL)
                   .background(Constants.Colors.azulPetroleo)
                   .foregroundColor(Constants.Colors.galeForce)
                   .cornerRadius(10)
                   .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
             }
          }

          HStack(spacing: 5) {
             ForEach((20...29), id: \.self) {
                Text("\(Constants.Alphabet.croatian[$0])")
                   .frame(width: (screenWidth - padding) / 10, height: 40, alignment: .center)
                   .font(Constants.Fonts.patrickHandL)
                   .background(Constants.Colors.azulPetroleo)
                   .foregroundColor(Constants.Colors.galeForce)
                   .cornerRadius(10)
                   .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
             }
          }

       }
       .frame(maxWidth: .infinity)
       .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
       .background(Constants.Colors.seaDeep)
    }
 }

 */
