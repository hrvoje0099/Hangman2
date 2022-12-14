//
// HighScoresView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct HighScoresView: View {
   @Environment(\.dismiss) var dismiss

   @State private var presentHighScoresInfoPopup = false

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.highScores) {
            dismiss()
         }

         HighScores(presentPopup: $presentHighScoresInfoPopup)
         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .navigationBarBackButtonHidden()
      .blur(radius: presentHighScoresInfoPopup ? 3 : 0)
      .disabled(presentHighScoresInfoPopup)
      .popup(isPresented: presentHighScoresInfoPopup, alignment: .center, direction: .top) {
         HighScoresPopupView {
            presentHighScoresInfoPopup.toggle()
         }
      }
   }
}

// MARK: - View Parts

struct HighScores: View {
   @Binding var presentPopup: Bool

   var body: some View {
      Section {
         ForEach((1...5).reversed(), id: \.self) { _ in
            HStack {
               ScoreColumnView(title: Constants.LocalisedString.date, value: "01.01.22").postfixedWithSpacer()
               ScoreColumnView(title: Constants.LocalisedString.score, value: "3500").postfixedWithSpacer()
               ScoreColumnView(title: Constants.LocalisedString.ratio, value: "15/05").postfixedWithSpacer()
               ScoreColumnView(title: Constants.LocalisedString.difficulty, value: "Easy").postfixedWithSpacer()
               ScoreColumnView(title: Constants.LocalisedString.time, value: "23m 41s")
            }
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 5)
            .background(Constants.Colors.seaDeep)
         }
      } header: {
         SectionHeaderView(text: Constants.LocalisedString.topFiveScores, withInfo: true) {
            presentPopup.toggle()
         }
         .padding(.bottom, 10)
      }
   }
}


// MARK: - Preview

struct HighScoresView_Previews: PreviewProvider {
   static var previews: some View {
      HighScoresView()
   }
}
