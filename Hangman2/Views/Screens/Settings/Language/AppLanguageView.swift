//
// AppLanguageView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct AppLanguageView: View {
   @Environment(\.dismiss) var dismiss

   @Binding var appLanguage: Language

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.appLanguage) {
            dismiss()
         }

         Section {
            CheckRowView(title: Constants.LanguageApp.english.localised, isLangSelected(.english)) {
               changeAppLanguage(to: .english)
            }

            CheckRowView(title: Constants.LanguageApp.croatian.localised, isLangSelected(.croatian)) {
               changeAppLanguage(to: .croatian)
            }
         } header: {
            SectionHeaderView(text: Constants.LocalisedString.chooseAppLanguage)
         }

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }

   // Helper Methods

   private func isLangSelected(_ lang: Language) -> Bool {
      lang == appLanguage
   }

   private func changeAppLanguage(to appLanguage: Language) {
      self.appLanguage = appLanguage
   }
}

// MARK: - Preview

struct AppLanguageView_Previews: PreviewProvider {
   static var previews: some View {
      AppLanguageView(appLanguage: .constant(Constants.LanguageApp.english))
   }
}
