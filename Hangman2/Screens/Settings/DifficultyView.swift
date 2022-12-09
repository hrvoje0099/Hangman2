//
//  DifficultyView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 10.11.2022..
//

import SwiftUI

struct DifficultyView: View {
   @Environment(\.dismiss) var dismiss

   @State private var presentPopup = false

   @State private var isEasy = false
   @State private var isMedium = true
   @State private var isHard = false

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.difficultyLevels) {
            dismiss()
         }

         Section {
            CheckRowView(
               title: Constants.GameDifficulty.easy.localised,
               isSelected: isSelected(difficulty: Constants.GameDifficulty.easy.localised)
            ) {
               changeGameDifficulty(to: Constants.GameDifficulty.easy)
            }

            CheckRowView(
               title: Constants.GameDifficulty.medium.localised,
               isSelected: isSelected(difficulty: Constants.GameDifficulty.medium.localised)
            ) {
               changeGameDifficulty(to: Constants.GameDifficulty.medium)
            }

            CheckRowView(
               title: Constants.GameDifficulty.hard.localised,
               isSelected: isSelected(difficulty: Constants.GameDifficulty.hard.localised)
            ) {
               changeGameDifficulty(to: Constants.GameDifficulty.hard)
            }
         } header: {
            SectionHeaderView(name: Constants.LocalisedString.selectGameDifficultyLvl, withInfo: true) {
               presentPopup.toggle()
            }
         }

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
      .blur(radius: presentPopup ? 3 : 0)
      .disabled(presentPopup)
      .popup(isPresented: presentPopup, alignment: .center, direction: .top) {
         DifficultyLevelsPopupView {
            presentPopup.toggle()
         }
      }
   }

   // MARK: - Helper Methods

   private func isSelected(difficulty: String) -> Bool {
      return difficulty == GlobalSettings.gameDifficulty.localised
   }

   private func changeGameDifficulty(to difficulty: Difficulty) {
      GlobalSettings.gameDifficulty = difficulty
   }
}

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
