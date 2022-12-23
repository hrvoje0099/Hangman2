//
//  DifficultyView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 10.11.2022..
//

import SwiftUI

// MARK: - Main View

struct DifficultyView: View {
   @Environment(\.dismiss) var dismiss

   @State private var presentDifficultyLevelsPopup = false

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.difficultyLevels) {
            dismiss()
         }

         Section {
            CheckRowView(title: Constants.LocalisedString.easy, isDifficultySelected(.easy)) {
               changeGameDifficulty(to: .easy)
            }

            CheckRowView(title: Constants.LocalisedString.medium, isDifficultySelected(.medium)) {
               changeGameDifficulty(to: .medium)
            }

            CheckRowView(title: Constants.LocalisedString.hard, isDifficultySelected(.hard)) {
               changeGameDifficulty(to: .hard)
            }
         } header: {
            SectionHeaderView(text: Constants.LocalisedString.selectGameDifficultyLvl, withInfo: true) {
               presentDifficultyLevelsPopup.toggle()
            }
         }

         Spacer()
      }
      .setupCommonModifiers(backgroundColor: Constants.Colors.bluewood, isPresented: presentDifficultyLevelsPopup)
      .popup(isPresented: presentDifficultyLevelsPopup, alignment: .center, direction: .top) {
         DifficultyLevelsPopupView {
            presentDifficultyLevelsPopup.toggle()
         }
      }
   }

   // Helper Methods

   private func isDifficultySelected(_ difficulty: Difficulty) -> Bool {
      return difficulty == GlobalSettings.gameDifficulty
   }

   private func changeGameDifficulty(to difficulty: Difficulty) {
      GlobalSettings.gameDifficulty = difficulty
   }
}

// MARK: - Preview

struct DifficultyView_Previews: PreviewProvider {
   static var previews: some View {
      DifficultyView()
         .environment(\.locale, .init(identifier: "hr"))
         .preferredColorScheme(.dark)
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
         .previewDisplayName("iPhone 14 Pro")

      DifficultyView()
         .environment(\.locale, .init(identifier: "en"))
         .preferredColorScheme(.light)
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
   }
}
