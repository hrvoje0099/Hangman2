//
// WordsLanguageView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct WordsLanguageView: View {
   @Environment(\.dismiss) var dismiss

   @EnvironmentObject private var wordModel: WordModel

   @Binding var wordsLanguage: Language

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.wordsLanguage) {
            dismiss()
         }

         Section {
            CheckRowView(title: Constants.LanguageWords.english.localised, isLangSelected(.english)) {
               changeWordsLanguage(to: .english)
            }

            CheckRowView(title: Constants.LanguageWords.croatian.localised, isLangSelected(.croatian)) {
               changeWordsLanguage(to: .croatian)
            }
         } header: {
            SectionHeaderView(text: Constants.LocalisedString.chooseWordsLanguage)
         }

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }

   // Helper Methods

   private func isLangSelected(_ lang: Language) -> Bool {
      lang == wordsLanguage
   }

   private func changeWordsLanguage(to wordsLanguage: Language) {
      self.wordsLanguage = wordsLanguage
      wordModel.getAllWords()
   }
}

// MARK: - Preview

struct WordsLanguageView_Previews: PreviewProvider {
   static var previews: some View {
      WordsLanguageView(wordsLanguage: .constant(Constants.LanguageWords.english))
   }
}
