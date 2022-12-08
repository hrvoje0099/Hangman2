//
// GameView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct GameView: View {
   @Environment(\.dismiss) var dismiss

   @State var presentPopup = false

   var body: some View {
      ZStack {
         Image(Constants.Images.backgroundGame)    // Background image
            .resizable()
            .ignoresSafeArea()

         GeometryReader { geometry in
            VStack(spacing: 0) {
               HStack {

                  // MARK: - Back button

                  Button {
                     dismiss()
                  } label: {
                     Image(Constants.Images.back)
                  }

                  Spacer()

                  // MARK: - Score button/view

                  HStack {
                     Image(Constants.Images.score)
                        .padding(EdgeInsets(top: 3, leading: 4, bottom: 3, trailing: 0))
                     #warning("hardcoded")
                     Text("1.735")
                        .padding(.trailing, 14)
                        .font(Constants.Fonts.patrickHandXS)
                        .foregroundColor(Constants.Colors.juanSan)
                  }
                  .background(Constants.Colors.sanJuan)
                  .cornerRadius(20)
                  .padding(.trailing, 25)
                  .onTapGesture {
                     presentPopup.toggle()
                  }

                  // MARK: - Time view

                  HStack {
                     Image(Constants.Images.timer)
                        .padding(EdgeInsets(top: 3, leading: 4, bottom: 3, trailing: 0))
                     #warning("hardcoded - start timer when we enter in view")
                     Text("12:00")
                        .padding(.trailing, 14)
                        .font(Constants.Fonts.patrickHandXS)
                        .foregroundColor(.white)
                  }
                  .background(Constants.Colors.carnation)
                  .cornerRadius(20)
                  .padding(.trailing, 25)

               }
               .padding(EdgeInsets(top: 20, leading: 20, bottom: 15, trailing: 0))
               .background(Constants.Colors.seaDeep)

               Divider()
                  .frame(height: 1)
                  .background(Constants.Colors.dugong)

               // MARK: - Character view

               #warning("hardcoded")
               Image(Constants.Images.character8)
                  .resizable()
                  .offset(x: -80, y: 0)

               // MARK: - Word view

               HStack {
                  #warning("harcoded")
                  ForEach(Array("ASOCIJACIJA"), id: \.self) { char in
                     ZStack {
//                        Text(""/*String(char)*/)
//                           .font(Constants.Fonts.patrickHand2XL)
//                           .foregroundColor(Constants.Colors.galeForce)
                        Text("_")
                           .font(Constants.Fonts.patrickHand2XL)
                           .foregroundColor(Constants.Colors.galeForce)
                           .offset(y: 5)
                     }
                  }
               }
               .frame(maxWidth: .infinity)

               // MARK: - Hint view

               #warning("hardcoded")
               Text("ovdje ce biti hint")
                  .padding(.bottom, 15)
                  .padding(.top, 5)
                  .font(Constants.Fonts.patrickHand2XS)
                  .foregroundColor(Constants.Colors.galeForce)
                  .opacity(GlobalSettings.showHint ? 1 : 0)

               // MARK: - Keyboard view

               getLanguageKeyboardView(geometry: geometry) { char in
                  print(char)
               }

            }
            .scrollContentBackground(.hidden)
            .navigationBarBackButtonHidden()
            .blur(radius: presentPopup ? 3 : 0)
            .disabled(presentPopup)
            .popup(isPresented: presentPopup, alignment: .center, direction: .top) {
               ScoringSystemView {
                  presentPopup.toggle()
               }
            }
         }
      }
   }

   // MARK: - Helper methods

   private func getLanguageKeyboardView(geometry: GeometryProxy, completion: @escaping (String) -> Void) -> AnyView {
      let wordsLanguage = GlobalSettings.wordsLanguage.localised

      switch wordsLanguage {
      case Constants.WordsLanguage.croatian.localised:
         return AnyView(CroatianKeyboardView(geometry: geometry) { char in
            completion(char)
         })
      case Constants.WordsLanguage.english.localised:
         return AnyView(EnglishKeyboardView(geometry: geometry) { char in
            completion(char)
         })
      default:
         #warning("handlat kroz error?")
         return AnyView(EmptyView())
      }
   }
}

struct GameView_Previews: PreviewProvider {
   static var previews: some View {
      GameView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
   }
}
