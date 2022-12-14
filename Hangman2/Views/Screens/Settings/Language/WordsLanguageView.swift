//
// WordsLanguageView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct WordsLanguageView: View {
   @Environment(\.dismiss) var dismiss

   @Binding var wordsLanguage: Language

   // MARK: - Bodz

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

   // MARK: - Helper Methods

   private func isLangSelected(_ lang: Language) -> Bool {
      lang == wordsLanguage
   }

   private func changeWordsLanguage(to wordsLanguage: Language) {
      self.wordsLanguage = wordsLanguage
   }
}

struct WordsLanguageView_Previews: PreviewProvider {
   static var previews: some View {
      WordsLanguageView(wordsLanguage: .constant(Constants.LanguageWords.english))
   }
}
