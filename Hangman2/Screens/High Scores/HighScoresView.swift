//
// HighScoresView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct HighScoresView: View {
   @Environment(\.dismiss) var dismiss

   @State var presentPopup = false

   // MARK: - BODY

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.highScores) {
            dismiss()
         }

         // MARK: - High Scores

         #warning("Value vrijednosti su hardkodirane!")
         Section {
            ForEach((1...5).reversed(), id: \.self) { _ in
               HStack {
                  ScoreColumnView(title: Constants.LocalisedString.date, value: "01.01.22")
                  Spacer()
                  ScoreColumnView(title: Constants.LocalisedString.score, value: "3500")
                  Spacer()
                  ScoreColumnView(title: Constants.LocalisedString.ratio, value: "15/05")
                  Spacer()
                  ScoreColumnView(title: Constants.LocalisedString.difficulty, value: "Easy")
                  Spacer()
                  ScoreColumnView(title: Constants.LocalisedString.time, value: "23m 41s")
               }
               .padding([.leading, .trailing], 20)
               .padding([.top, .bottom], 5)
               .background(Constants.Colors.seaDeep)
            }
         } header: {
            SectionHeaderView(name: Constants.LocalisedString.topFiveScores, withInfo: true) {
               presentPopup.toggle()
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
         }

         // MARK: - Statistics

         NavigationLink(destination: StatisticsView()) {
            TextButton(
               text: Constants.LocalisedString.statistics,
               font: Constants.Fonts.patrickHandL,
               color: Constants.Colors.carnation,
               textColor: .white
            )
         }
         .padding(25)

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
      .blur(radius: presentPopup ? 3 : 0)
      .disabled(presentPopup)
      .popup(isPresented: presentPopup, alignment: .center, direction: .top) {
         HighScoresPopupView {
            presentPopup.toggle()
         }
      }
   }
}

// MARK: - PREVIEW

struct HighScoresView_Previews: PreviewProvider {
   static var previews: some View {
      HighScoresView()
   }
}
