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

   private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   @State private var timeRemaining = 0

   @EnvironmentObject private var wordModel: WordModel
   @State var randomWord: Word?

   var body: some View {

      ZStack {
         BackgroundImageView(imageName: Constants.Images.backgroundGame)    // Background image

         GeometryReader { geometry in
            VStack(spacing: 0) {
               headerNavigationView
               dividerView
               characterImageView
               wordView
               hintView

               getLanguageKeyboardView(geometry) { char in
                  print(char)
               }
            }
            .setupCommonModifiers(backgroundColor: .clear, isPresented: (presentScoringSystemPopup || presentConfirmPopup))
            .popup(isPresented: presentScoringSystemPopup || presentConfirmPopup, alignment: .center, direction: .top) {
               if presentScoringSystemPopup {
                  ScoringSystemPopupView {
                     presentScoringSystemPopup.toggle()
                  }
               } else {
                  ConfirmPopupView { isGoBack in
                     isGoBack ? dismiss() : presentConfirmPopup.toggle()
                  }
               }
            }
            .onAppear {
               randomWord = wordModel.getRandomWord()
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
               text: "1.735",
               foregroundColor: Constants.Colors.juanSan,
               backgroundColor: Constants.Colors.sanJuan
            ) {
               presentScoringSystemPopup.toggle()
            }

            CapsuleButton(
               image: Constants.Images.timer,
               text: "\(timeString(time: timeRemaining))",
               foregroundColor: .white,
               backgroundColor: Constants.Colors.carnation
            )
            .onReceive(timer) { _ in
               self.timeRemaining += 1
            }
         }
         .padding([.top, . bottom], 15)
         .background(Constants.Colors.seaDeep)
      }

      // Convert the time into 24hr (24:00:00) format
      func timeString(time: Int) -> String {
         let day     = Int(time) / 86_400
         let hours   = Int(time) / 3600 % 24
         let minutes = Int(time) / 60 % 60
         let seconds = Int(time) % 60

         switch time {
         case 0..<60: return String(format: "%02i", seconds)
         case 60..<3600: return String(format: "%02i:%02i", minutes, seconds)
         case 3600..<86_400: return  String(format: "%02i:%02i:%02i", hours, minutes, seconds)
         default: return String(format: "%02i:%02i:%02i:%02i", day, hours, minutes, seconds)
         }
      }
   }

   private var dividerView: some View {
      Divider().background(Constants.Colors.dugong)
   }

   private var characterImageView: some View {
      Image(Constants.Images.character8)
         .resizable()
         .offset(x: -80, y: 0)
   }

   private var wordView: some View {
      Group {
         HStack {
            if let word = randomWord?.word {
               ForEach(0...word.count - 1, id: \.self) { _ in
                  ZStack {
//                     Text(""/*String(char)*/)
//                        .font(Constants.Fonts.patrickHand2XL)
//                        .foregroundColor(Constants.Colors.galeForce)
                     Text("_")
                        .font(Constants.Fonts.patrickHand2XL)
                        .foregroundColor(Constants.Colors.azulPetroleo)
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
         if let hint = randomWord?.hint {
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
}

// MARK: - Preview

struct GameView_Previews: PreviewProvider {
   static var previews: some View {
      Group {
         GameView().environmentObject({ () -> WordModel in
            let wordModel = WordModel(wordService: WordService())
            wordModel.getAllWords()
            return wordModel
         }())
      }
   }
}
