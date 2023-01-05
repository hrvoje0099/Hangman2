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

   @State private var presentConfirmPopup = false
   @State private var presentScoringSystemPopup = false
   @State private var timeRemaining = 0

   @EnvironmentObject private var appModel: AppModel

   var body: some View {

      ZStack {
         BackgroundImageView(imageName: Constants.Images.backgroundGame)

         GeometryReader { geometry in
            VStack(spacing: 0) {
               headerNavigationView
               dividerView
               characterImageView
               wordView
               hintView

               getLanguageKeyboardView(geometry) { letter in
                  appModel.check(letter, with: timeRemaining)
               }
            }
            .setupCommonModifiers(
               backgroundColor: .clear,
               isPresented: (presentScoringSystemPopup || presentConfirmPopup || appModel.showFinishGamePopup)
            )
            .popup(isPresented: presentScoringSystemPopup, alignment: .center, direction: .top) {
               ScoringSystemPopupView {
                  presentScoringSystemPopup.toggle()
               }
            }
            .popup(isPresented: presentConfirmPopup, alignment: .center, direction: .top) {
               ConfirmPopupView { isGoBack in
                  if isGoBack {
                     dismiss()
                  } else {
                     presentConfirmPopup.toggle()
                  }
               }
            }
            .popup(isPresented: appModel.showFinishGamePopup, alignment: .center, direction: .top) {
               GameInfoPopupView(
                  isCorrectFinish: appModel.game.isCorrectFinish,
                  word: appModel.game.word.uppercased()
               ) {
                  appModel.startNewGame()
                  appModel.cleanLetters()
                  appModel.showFinishGamePopup.toggle()
               }
            }
            .onAppear(perform: appModel.startGame)
            .onAppear(perform: appModel.bindLetters)
         }
      }
   }
}

// MARK: - View Parts

extension GameView {
   private var headerNavigationView: some View {
      return Group {
         HStack {
            BackImageButton {
               presentConfirmPopup.toggle()
            }

            Spacer()

            CapsuleButton(
               image: Constants.Images.score,
               text: String(appModel.game.score),
               foregroundColor: Constants.Colors.juanSan,
               backgroundColor: Constants.Colors.sanJuan
            ) {
               presentScoringSystemPopup.toggle()
            }

            CapsuleButton(
               image: Constants.Images.timer,
               text: timeRemaining.convertTimeToString(),
               foregroundColor: .white,
               backgroundColor: Constants.Colors.carnation
            )
            .onReceive(appModel.timer) { _ in
               self.timeRemaining += 1
            }
         }
         .padding([.top, . bottom], 15)
         .background(Constants.Colors.seaDeep)
      }
   }

   private var dividerView: some View {
      Divider().background(Constants.Colors.dugong)
   }

   private var characterImageView: some View {
      Image(appModel.getHangmanImage())
         .resizable()
         .offset(x: -80, y: 0)
   }

   private var wordView: some View {
      Group {
         HStack {
            if let wordParts = appModel.game.parts {
               ForEach(wordParts) { word in
                  ZStack {
                     Text(String(word.letter.uppercased()))
                        .font(Constants.Fonts.patrickHand2XL)
                        .foregroundColor(Constants.Colors.galeForce)
                     Text("_")
                        .font(Constants.Fonts.patrickHand2XL)
                        .foregroundColor(word.isSelected ? Constants.Colors.galeForce : Constants.Colors.azulPetroleo)
                        .offset(y: 5)
                  }
               }
            }
         }
         .frame(maxWidth: .infinity)
      }
   }

   private var hintView: some View {
      Group {
         if let hint = appModel.game.hint {
            Text(hint)
               .padding(.bottom, 15)
               .padding(.top, 5)
               .font(Constants.Fonts.patrickHand2XS)
               .foregroundColor(Constants.Colors.azulPetroleo)
               .opacity(GlobalSettings.showHint ? 1 : 0)
         } else {
            EmptyView()
         }
      }
   }

   private func getLanguageKeyboardView(_ geometry: GeometryProxy, completion: @escaping (Letter) -> Void) -> AnyView {
      let wordsLanguage = AppSettings.shared.wordsLanguage

      switch wordsLanguage {
      case .english:
         return AnyView(EnglishKeyboardView(geometry: geometry) { letter in
            completion(letter)
         })
      case .croatian:
         return AnyView(CroatianKeyboardView(geometry: geometry) { letter in
            completion(letter)
         })
      }
   }
}
