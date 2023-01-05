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

   @EnvironmentObject private var appModel: AppModel

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.highScores) {
            dismiss()
         }

         highScoresView
      }
      .setupCommonModifiers(backgroundColor: Constants.Colors.bluewood, isPresented: presentHighScoresInfoPopup)
      .popup(isPresented: presentHighScoresInfoPopup, alignment: .center, direction: .top) {
         HighScoresPopupView {
            presentHighScoresInfoPopup.toggle()
         }
      }
   }
}

// MARK: - View Parts

extension HighScoresView {
   private var highScoresView: some View {
      Group {
         Section {
            ScrollViewIfNeeded {
               ForEach(appModel.getHighScores()) { highScore in
                  HStack(spacing: 0) {
                     ScoreColumnView(title: Constants.LocalisedString.date, value: LocalizedStringKey(highScore.date))
                        .frame(minWidth: 0, maxWidth: .infinity)
                     ScoreColumnView(title: Constants.LocalisedString.score, value: LocalizedStringKey(highScore.score.description))
                        .frame(minWidth: 0, maxWidth: .infinity)
                     ScoreColumnView(title: Constants.LocalisedString.ratio, value: LocalizedStringKey(highScore.ratio))
                        .frame(minWidth: 0, maxWidth: .infinity)
                     ScoreColumnView(title: Constants.LocalisedString.difficulty, value: highScore.difficulty)
                        .frame(minWidth: 0, maxWidth: .infinity)
                     ScoreColumnView(title: Constants.LocalisedString.time, value: LocalizedStringKey(highScore.time))
                        .frame(minWidth: 0, maxWidth: .infinity)
                  }
                  .frame(minWidth: 0, maxWidth: .infinity)
                  .padding([.leading, .trailing], 10)
                  .padding([.top, .bottom], 5)
                  .background(Constants.Colors.seaDeep)
               }
            }
         } header: {
            SectionHeaderView(text: Constants.LocalisedString.topTenScores, withInfo: true) {
               presentHighScoresInfoPopup.toggle()
            }
            .padding(.bottom, 10)
         }

         Spacer()
      }
   }
}

// MARK: - Preview

struct HighScoresView_Previews: PreviewProvider {
   static var previews: some View {
      HighScoresView()
   }
}
