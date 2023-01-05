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

   @EnvironmentObject private var appModel: AppModel

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.statistics) {
            dismiss()
         }

         winRateView
         Overview()
         Spacer()
      }
      .setupCommonModifiers(backgroundColor: Constants.Colors.bluewood, isPresented: presentWinRateInfoPopup)
      .popup(isPresented: presentWinRateInfoPopup, alignment: .center, direction: .top) {
         InfoPopupView(text: Constants.LocalisedString.winRateInfo) {
            presentWinRateInfoPopup.toggle()
         }
      }
   }
}

// MARK: - View Parts

extension StatisticsView {
   private var winRateView: some View {
      Group {
         SectionHeaderView(text: Constants.LocalisedString.winRate, withInfo: true) {
            presentWinRateInfoPopup.toggle()
         }

         HStack {
            CircularProgressView(progressValue: appModel.getTotalWinRate())
               .frame(width: 140, height: 140)
               .padding(15)

            VStack {
               VStack(spacing: 5) {
                  DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyEasy, rateValue: appModel.getTotalWinRate(by: .easy))
                  SegmentedProgressView(progress: appModel.getTotalWinRate(by: .easy), length: 6)
               }
               Spacer()
               VStack(spacing: 5) {
                  DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyMedium, rateValue: appModel.getTotalWinRate(by: .medium))
                  SegmentedProgressView(progress: appModel.getTotalWinRate(by: .medium), length: 6)
               }
               Spacer()
               VStack(spacing: 5) {
                  DifficultyRateView(difficultyName: Constants.LocalisedString.difficultyHard, rateValue: appModel.getTotalWinRate(by: .hard))
                  SegmentedProgressView(progress: appModel.getTotalWinRate(by: .hard), length: 6)
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
}

private struct Overview: View {
   var body: some View {
      SectionHeaderView(text: Constants.LocalisedString.overview)

      Grid(alignment: .leading, horizontalSpacing: 0) {
         GridRow {
            OverviewCardView(title: Constants.LocalisedString.played, value: String(GlobalSettings.wins + GlobalSettings.losses), type: .good)
            OverviewCardView(title: Constants.LocalisedString.perfectWins, value: String(GlobalSettings.perfectWins), type: .good)
         }
         GridRow {
            OverviewCardView(title: Constants.LocalisedString.wins, value: String(GlobalSettings.wins), type: .good)
            OverviewCardView(title: Constants.LocalisedString.longestGame, value: GlobalSettings.longestGame.convertTimeToString(), type: .good)
         }
         GridRow {
            OverviewCardView(title: Constants.LocalisedString.losses, value: String(GlobalSettings.losses), type: .bad)
            OverviewCardView(title: Constants.LocalisedString.totalTime, value: GlobalSettings.totalTime.convertTimeToString(), type: .bad)
         }
      }
      .padding(15)
   }
}

// MARK: - Preview

struct StatisticsView_Previews: PreviewProvider {
   static var previews: some View {
      StatisticsView()
   }
}
