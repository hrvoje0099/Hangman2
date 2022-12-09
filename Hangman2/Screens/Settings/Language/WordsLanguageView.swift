//
// WordsLanguageView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct WordsLanguageView: View {
   @Environment(\.dismiss) var dismiss

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.wordsLanguage) {
            dismiss()
         }

         Section {
            CheckRowView(
               title: Constants.LanguageWords.english.localised,
               isSelected: isSelected(lang: Constants.LocalisedString.english)
            ) {
               changeWordsLanguage(to: Constants.LanguageWords.english)
            }

            CheckRowView(
               title: Constants.LanguageWords.croatian.localised,
               isSelected: isSelected(lang: Constants.LocalisedString.croatian)
            ) {
               changeWordsLanguage(to: Constants.LanguageWords.croatian)
            }
         } header: {
            SectionHeaderView(name: Constants.LocalisedString.chooseWordsLanguage)
         }

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }

   // MARK: - Helper Methods

   private func isSelected(lang: String) -> Bool {
      lang == GlobalSettings.wordsLanguage.localised
   }

   private func changeWordsLanguage(to wordsLanguage: Language) {
      GlobalSettings.wordsLanguage = wordsLanguage
   }
}

struct WordsLanguageView_Previews: PreviewProvider {
   static var previews: some View {
      WordsLanguageView()
   }
}
