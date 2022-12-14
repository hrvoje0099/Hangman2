//
// GameView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct GameView: View {
   @Environment(\.dismiss) var dismiss

   @State var presentConfirmPopup = false
   @State var presentScoringSystemPopup = false

   private let testWord = "ASOCIJACIJA"
   private let testHint = "ovdje ce pisati hint"

   var body: some View {
      ZStack {
         BackgroundImageView(imageName: Constants.Images.backgroundGame)    // Background image

         GeometryReader { geometry in
            VStack(spacing: 0) {
               HeaderNavigation(presentConfirmPopup: $presentConfirmPopup, presentScoringSystemPopup: $presentScoringSystemPopup)
               Divider().background(Constants.Colors.dugong)
               CharacterImageView(imageName: Constants.Images.character8)
               Word(word: testWord)
               Hint(hint: testHint)

               getLanguageKeyboardView(geometry) { char in
                  print(char)
               }
            }
            .navigationBarBackButtonHidden()
            .blur(radius: presentScoringSystemPopup || presentConfirmPopup ? 3 : 0)
            .disabled(presentScoringSystemPopup || presentConfirmPopup)
            .popup(isPresented: presentScoringSystemPopup, alignment: .center, direction: .top) {
               ScoringSystemPopupView {
                  presentScoringSystemPopup.toggle()
               }
            }
            .popup(isPresented: presentConfirmPopup, alignment: .center, direction: .top) {
               ConfirmPopupView { isGoBack in
                  isGoBack ? dismiss() : presentConfirmPopup.toggle()
               }
            }
         }
      }
   }

   // Helper methods

   private func getLanguageKeyboardView(_ geometry: GeometryProxy, completion: @escaping (String) -> Void) -> AnyView {
      let wordsLanguage = AppSettings.shared.wordsLanguage

      switch wordsLanguage {
      case .english:
         return AnyView(EnglishKeyboardView(geometry: geometry) { char in
            completion(char)
         })
      case .croatian:
         return AnyView(CroatianKeyboardView(geometry: geometry) { char in
            completion(char)
         })
      }
   }
}

// MARK: - View Parts

struct HeaderNavigation: View {
   @Binding var presentConfirmPopup: Bool
   @Binding var presentScoringSystemPopup: Bool

   var body: some View {
      HStack {
         BackImageButton {
            presentConfirmPopup.toggle()
         }

         Spacer()

         CapsuleButton(
            image: Constants.Images.score,
            text: "1.735",
            foregroundColor: Constants.Colors.juanSan,
            backgroundColor: Constants.Colors.sanJuan
         ) {
            presentScoringSystemPopup.toggle()
         }

         CapsuleButton(
            image: Constants.Images.timer,
            text: "12:00",
            foregroundColor: .white,
            backgroundColor: Constants.Colors.carnation
         )
      }
      .padding([.top, . bottom], 15)
      .background(Constants.Colors.seaDeep)
   }
}

struct CharacterImageView: View {
   let imageName: String

   var body: some View {
      Image(imageName)
         .resizable()
         .offset(x: -80, y: 0)
   }
}

struct Word: View {
   let word: String

   var body: some View {
      HStack {
         ForEach(0...word.count - 1, id: \.self) { _ in
            ZStack {
//                        Text(""/*String(char)*/)
//                           .font(Constants.Fonts.patrickHand2XL)
//                           .foregroundColor(Constants.Colors.galeForce)
               Text("_")
                  .font(Constants.Fonts.patrickHand2XL)
                  .foregroundColor(Constants.Colors.azulPetroleo)
                  .offset(y: 5)
            }
         }
      }
      .frame(maxWidth: .infinity)
   }
}

struct Hint: View {
   let hint: String

   var body: some View {
      Text(hint)
         .padding(.bottom, 15)
         .padding(.top, 5)
         .font(Constants.Fonts.patrickHand2XS)
         .foregroundColor(Constants.Colors.azulPetroleo)
         .opacity(GlobalSettings.showHint ? 1 : 0)
   }
}

// MARK: - Preview

struct GameView_Previews: PreviewProvider {
   static var previews: some View {
      GameView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
   }
}
