//
// StatisticsView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct StatisticsView: View {
   @Environment(\.dismiss) var dismiss

   @State private var presentWinRateInfoPopup = false

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.statistics) {
            dismiss()
         }

         WinRate(presentPopup: $presentWinRateInfoPopup)
         Overview()
         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .navigationBarBackButtonHidden()
      .blur(radius: presentWinRateInfoPopup ? 3 : 0)
      .disabled(presentWinRateInfoPopup)
      .popup(isPresented: presentWinRateInfoPopup, alignment: .center, direction: .top) {
         InfoPopupView(text: Constants.LocalisedString.winRateInfo) {
            presentWinRateInfoPopup.toggle()
         }
      }
   }
}

// MARK: - View Parts

struct WinRate: View {
   @Binding var presentPopup: Bool

   var body: some View {
      SectionHeaderView(text: Constants.LocalisedString.winRate, withInfo: true) {
         presentPopup.toggle()
      }

      HStack {
         CircularProgressView(progress: 0.50)
            .frame(width: 140, height: 140)
            .padding(15)

         VStack {
            VStack(spacing: 5) {
               DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyEasy, rateValue: 100)
               SegmentedProgressView(progress: 100, length: 6)
            }
            Spacer()
            VStack(spacing: 5) {
               DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyMedium, rateValue: 54)
               SegmentedProgressView(progress: 54, length: 6)
            }
            Spacer()
            VStack(spacing: 5) {
               DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyHard, rateValue: 25)
               SegmentedProgressView(progress: 25, length: 6)
            }
         }
         .frame(height: 140)
         .padding(.trailing, 15)
      }
      .background(Constants.Colors.seaDeep)
      .cornerRadius(15)
      .padding(15)
   }
}

struct Overview: View {
   var body: some View {
      SectionHeaderView(text: Constants.LocalisedString.overview)

      Grid(alignment: .leading, horizontalSpacing: 0) {
         GridRow {
            OverviewCardView(title: Constants.LocalisedString.played, value: "532", type: .good)
            OverviewCardView(title: Constants.LocalisedString.wins, value: "369", type: .good)
            OverviewCardView(title: Constants.LocalisedString.losses, value: "152", type: .bad)
         }
         .frame(maxWidth: .infinity)
         GridRow {
            OverviewCardView(title: Constants.LocalisedString.perfectWins, value: "11", type: .good)
            OverviewCardView(title: Constants.LocalisedString.longestGame, value: "2h 12m 12s", type: .good)
            OverviewCardView(title: Constants.LocalisedString.highestScore, value: "5321", type: .good)
         }
         .frame(maxWidth: .infinity)
         GridRow {
            OverviewCardView(title: Constants.LocalisedString.hits, value: "1073", type: .good)
            OverviewCardView(title: Constants.LocalisedString.wrongGuesses, value: "221", type: .bad)
            OverviewCardView(title: Constants.LocalisedString.totalTime, value: "22h 11m", type: .bad)
         }
         .frame(maxWidth: .infinity)
      }
      .padding(15)
   }
}

// MARK: - Previews

struct StatisticsView_Previews: PreviewProvider {
   static var previews: some View {
      ForEach(ColorScheme.allCases, id: \.self) {
         StatisticsView().preferredColorScheme($0)
      }
   }
}
