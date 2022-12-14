//
//  DifficultyView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 10.11.2022..
//

import SwiftUI

// MARK: - Main View

struct DifficultyView: View {

   // Properties

   @Environment(\.dismiss) var dismiss

   @Binding var gameDifficulty: Difficulty

   @State private var presentPopup = false

   @State private var isEasy = false
   @State private var isMedium = true
   @State private var isHard = false

   // Body

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
               presentPopup.toggle()
            }
         }

         Spacer()
      }
      .groupedViewSetupWhereIsPopup(backgroundColor: Constants.Colors.bluewood, isPresented: presentPopup)
      .popup(isPresented: presentPopup, alignment: .center, direction: .top) {
         DifficultyLevelsPopupView {
            presentPopup.toggle()
         }
      }
   }

   // Helper Methods

   private func isDifficultySelected(_ difficulty: Difficulty) -> Bool {
      return difficulty == gameDifficulty
   }

   private func changeGameDifficulty(to difficulty: Difficulty) {
      self.gameDifficulty = difficulty
   }
}

// MARK: - Preview

struct DifficultyView_Previews: PreviewProvider {
   static var previews: some View {
      DifficultyView(gameDifficulty: .constant(.easy))
         .environment(\.locale, .init(identifier: "hr"))
         .preferredColorScheme(.dark)
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
         .previewDisplayName("iPhone 14 Pro")

      DifficultyView(gameDifficulty: .constant(.hard))
         .environment(\.locale, .init(identifier: "en"))
         .preferredColorScheme(.light)
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
   }
}
