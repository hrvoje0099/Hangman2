//
//  SettingsView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 08.11.2022..
//

import SwiftUI

enum SettingsConst {
}

struct SettingsView: View {
   @Environment(\.dismiss) var dismiss

   @State private var isShowHint = false

   private let sectionPadding = EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)

   // MARK: - Body

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.settings) {
            dismiss()
         }

         ScrollView {

            // MARK: - Options

            Section {
               ToggleRowView(
                  name: Constants.LocalisedString.darkMode, onImageName: Constants.Images.moonFill,
                  offImageName: Constants.Images.sunMaxFill, bindValue: AppSettings.shared.currentTheme == .dark
               ) { _ in
                  let currentTheme = AppSettings.shared.currentTheme
                  AppSettings.shared.currentTheme = currentTheme == .light ? .dark : .light
               }

               ToggleRowView(
                  name: Constants.LocalisedString.showHint, onImageName: Constants.Images.lightbulbFill,
                  offImageName: Constants.Images.lightbulbSlashFill, bindValue: GlobalSettings.showHint
               ) { showHint in
                  GlobalSettings.showHint = showHint
               }

               NavigationLink(destination: DifficultyView()) {
                  DisclosureRowView(
                     title: Constants.LocalisedString.difficultyLevels,
                     trailingText: LocalizedStringKey(GlobalSettings.gameDifficulty.localised)
                  )
               }
            } header: {
               SectionHeaderView(name: Constants.LocalisedString.options)
                  .padding(sectionPadding)
            }

            // MARK: - Language

            Section {
               DisclosureRowView(title: Constants.LocalisedString.application, trailingText: getApplicationLanguage())
                  .onTapGesture {
                     UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                  }

               NavigationLink(destination: LanguageView()) {
                  DisclosureRowView(
                     title: Constants.LocalisedString.words,
                     trailingText: LocalizedStringKey(GlobalSettings.wordsLanguage.localised)
                  )
               }
            } header: {
               SectionHeaderView(name: Constants.LocalisedString.language, withInfo: true) {
                  print("Language info")
               }
               .padding(sectionPadding)
            }

            // MARK: - Misc

            Section {
               NavigationLink(destination: WordsListView()) {
                  DisclosureRowView(title: Constants.LocalisedString.listOfAllWords)
               }

               NavigationLink(destination: AboutView()) {
                  DisclosureRowView(title: Constants.LocalisedString.about)
               }
            } header: {
               SectionHeaderView(name: Constants.LocalisedString.misc)
                  .padding(sectionPadding)
            }

         }
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }

   // MARK: - Helper methods

   private func getApplicationLanguage() -> LocalizedStringKey {
      let localIdentifier = Locale.current.language.languageCode?.identifier

      if let localIdentifier {
         switch localIdentifier {
         case Constants.WordsLanguage.croatian.location:
            return LocalizedStringKey(Constants.WordsLanguage.croatian.localised)
         default:
            return LocalizedStringKey(Constants.WordsLanguage.english.localised)
         }
      }
      return ""
   }
}

struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView()
   }
}
