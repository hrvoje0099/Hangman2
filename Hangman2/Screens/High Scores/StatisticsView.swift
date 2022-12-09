//
// StatisticsView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct StatisticsView: View {
   @Environment(\.dismiss) var dismiss

   @State var presentPopup = false

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.statistics) {
            dismiss()
         }

         // MARK: - Win Rate

         SectionHeaderView(name: Constants.LocalisedString.winRate, withInfo: true) {
            presentPopup.toggle()
         }

         #warning("Rate value i progress su hardkodirane vrijednosti!")
         HStack {
            CircularProgressView(progress: 0.50)
               .frame(width: 140, height: 140)
               .padding(15)

            VStack {
               VStack(spacing: 5) {
                  DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyEasy, rateValue: 100)
                  SegmentedProgressView(
                     progress: 100,
                     length: 6,
                     startColor: Constants.Colors.carnation,
                     endColor: Constants.Colors.mintLeaf,
                     spaceColor: Constants.Colors.seaDeep,
                     backgroundColor: Constants.Colors.azulPetroleo
                  )
               }

               Spacer()

               VStack(spacing: 5) {
                  DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyMedium, rateValue: 54)
                  SegmentedProgressView(
                     progress: 54,
                     length: 6,
                     startColor: Constants.Colors.carnation,
                     endColor: Constants.Colors.mintLeaf,
                     spaceColor: Constants.Colors.seaDeep,
                     backgroundColor: Constants.Colors.azulPetroleo
                  )
               }

               Spacer()

               VStack(spacing: 5) {
                  DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyHard, rateValue: 25)
                  SegmentedProgressView(
                     progress: 25,
                     length: 6,
                     startColor: Constants.Colors.carnation,
                     endColor: Constants.Colors.mintLeaf,
                     spaceColor: Constants.Colors.seaDeep,
                     backgroundColor: Constants.Colors.azulPetroleo
                  )
               }
            }
            .frame(height: 140)
            .padding(.trailing, 15)

         }
         .frame(maxWidth: .infinity, alignment: .leading)
         .background(Constants.Colors.seaDeep)
         .cornerRadius(15)
         .padding(EdgeInsets(top: 15, leading: 23, bottom: 10, trailing: 23))

         // MARK: - Overview

         SectionHeaderView(name: Constants.LocalisedString.overview)

         #warning("Value vrijednosti u karticama su hardoded!")
         LazyVGrid(
            columns: [
               GridItem(.flexible()),
               GridItem(.flexible()),
               GridItem(.flexible())
            ], spacing: 10
         ) {
            OverviewCardView(title: Constants.LocalisedString.played, value: "532")
            OverviewCardView(title: Constants.LocalisedString.wins, value: "369")

            OverviewCardView(
               title: Constants.LocalisedString.losses,
               value: "152",
               dividerColor: Constants.Colors.carnation,
               startColor: Constants.Colors.carnation.opacity(0.2),
               endColor: Constants.Colors.bluewood
            )

            OverviewCardView(title: Constants.LocalisedString.perfectWins, value: "11")
            OverviewCardView(title: Constants.LocalisedString.longestGame, value: "2h 12m 55s")
            OverviewCardView(title: Constants.LocalisedString.highestScore, value: "5321")
            OverviewCardView(title: Constants.LocalisedString.hits, value: "1073")

            OverviewCardView(
               title: Constants.LocalisedString.wrongGuesses,
               value: "221",
               dividerColor: Constants.Colors.carnation,
               startColor: Constants.Colors.carnation.opacity(0.2),
               endColor: Constants.Colors.bluewood
            )

            OverviewCardView(
               title: Constants.LocalisedString.totalTime,
               value: "22h 11m",
               dividerColor: Constants.Colors.carnation,
               startColor: Constants.Colors.carnation.opacity(0.2),
               endColor: Constants.Colors.bluewood
            )
         }
         .padding(EdgeInsets(top: 15, leading: 23, bottom: 10, trailing: 23))

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
      .blur(radius: presentPopup ? 3 : 0)
      .disabled(presentPopup)
      .popup(isPresented: presentPopup, alignment: .center, direction: .top) {
         WinRatePopupView {
            presentPopup.toggle()
         }
      }
   }
}

struct StatisticsView_Previews: PreviewProvider {
   static var previews: some View {
      ForEach(ColorScheme.allCases, id: \.self) {
         StatisticsView().preferredColorScheme($0)
      }
   }
}
