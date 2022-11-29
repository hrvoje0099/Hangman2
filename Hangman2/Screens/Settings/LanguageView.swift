//
// LanguageView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct LanguageView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.wordsLanguage) {
            self.presentationMode.wrappedValue.dismiss()
         }

         Section {
            CheckgRowView(title: Constants.WordsLanguage.english.localised, isSelected: isSelected(lang: Constants.LocalisedString.english)) {
               changeWordsLanguage(to: Constants.WordsLanguage.english)
            }

            CheckgRowView(title: Constants.WordsLanguage.croatian.localised, isSelected: isSelected(lang: Constants.LocalisedString.croatian)) {
               changeWordsLanguage(to: Constants.WordsLanguage.croatian)
            }
         } header: {
            SectionHeaderView(name: Constants.LocalisedString.chooseWordsLanguage)
         }

         Spacer()
      }
      .background(Constants.Colors.woodBlue)
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

struct LanguageView_Previews: PreviewProvider {
   static var previews: some View {
      LanguageView()
   }
}
