//
// CroatianKeyboardView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CroatianKeyboardView: View {
   let geometry: GeometryProxy
   let action: (String) -> Void

   var body: some View {
      VStack(spacing: 12) {
         let screenWidth = geometry.size.width
         let padding = CGFloat(65)
         HStack(spacing: 5) {
            ForEach((0...7), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.croatian[index])
               } label: {
                  Text("\(Constants.Alphabet.croatian[index])")
                     .frame(width: (screenWidth - padding) / 8, height: 40, alignment: .center)
                     .font(Constants.Fonts.patrickHandL)
                     .background(Constants.Colors.azulPetroleo)
                     .foregroundColor(Constants.Colors.galeForce)
                     .cornerRadius(10)
                     .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((8...14), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.croatian[index])
               } label: {
                  Text("\(Constants.Alphabet.croatian[index])")
                     .frame(width: (screenWidth - padding) / 8, height: 40, alignment: .center)
                     .font(Constants.Fonts.patrickHandL)
                     .background(Constants.Colors.azulPetroleo)
                     .foregroundColor(Constants.Colors.galeForce)
                     .cornerRadius(10)
                     .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((15...22), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.croatian[index])
               } label: {
                  Text("\(Constants.Alphabet.croatian[index])")
                     .frame(width: (screenWidth - padding) / 8, height: 40, alignment: .center)
                     .font(Constants.Fonts.patrickHandL)
                     .background(Constants.Colors.azulPetroleo)
                     .foregroundColor(Constants.Colors.galeForce)
                     .cornerRadius(10)
                     .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
               }
            }
         }

         HStack(spacing: 5) {
            ForEach((23...29), id: \.self) { index in
               Button {
                  action(Constants.Alphabet.croatian[index])
               } label: {
                  Text("\(Constants.Alphabet.croatian[index])")
                     .frame(width: (screenWidth - padding) / 8, height: 40, alignment: .center)
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
