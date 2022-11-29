//
//  DifficultyView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 10.11.2022..
//

import SwiftUI

struct DifficultyView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   
   @State private var isEasy = false
   @State private var isMedium = true
   @State private var isHard = false
   
   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.difficultyLevel) {
            self.presentationMode.wrappedValue.dismiss()
         }
         
         Section {
            CheckgRowView(title: Constants.GameDifficulty.easy.localised, isSelected: isSelected(difficulty: Constants.GameDifficulty.easy.localised)) {
               changeGameDifficulty(to: Constants.GameDifficulty.easy)
            }

            CheckgRowView(title: Constants.GameDifficulty.medium.localised, isSelected: isSelected(difficulty: Constants.GameDifficulty.medium.localised)) {
               changeGameDifficulty(to: Constants.GameDifficulty.medium)
            }

            CheckgRowView(title: Constants.GameDifficulty.hard.localised, isSelected: isSelected(difficulty: Constants.GameDifficulty.hard.localised)) {
               changeGameDifficulty(to: Constants.GameDifficulty.hard)
            }
         } header: {
            SectionHeaderView(name: Constants.LocalisedString.selectGameDifficultyLvl)
         }
         
         Spacer()
      }
      .background(Constants.Colors.woodBlue)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
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
   }
}
