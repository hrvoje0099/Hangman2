//
// AppLanguageView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct AppLanguageView: View {
   @Environment(\.dismiss) var dismiss

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.appLanguage) {
            dismiss()
         }

         Section {
            CheckRowView(
               title: Constants.LanguageApp.english.localised,
               isSelected: isSelected(lang: Constants.LocalisedString.english)
            ) {
               changeAppLanguage(to: Constants.LanguageApp.english)
            }

            CheckRowView(
               title: Constants.LanguageApp.croatian.localised,
               isSelected: isSelected(lang: Constants.LocalisedString.croatian)
            ) {
               changeAppLanguage(to: Constants.LanguageApp.croatian)
            }
         } header: {
            SectionHeaderView(name: Constants.LocalisedString.chooseAppLanguage)
         }

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }

   // MARK: - Helper Methods

   private func isSelected(lang: String) -> Bool {
      lang == AppSettings.shared.currentLang.localised
   }

   private func changeAppLanguage(to appLanguage: Language) {
      AppSettings.shared.currentLang = appLanguage
   }
}

struct AppLanguageView_Previews: PreviewProvider {
   static var previews: some View {
      AppLanguageView()
   }
}
