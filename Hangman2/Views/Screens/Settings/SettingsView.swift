//
//  SettingsView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 08.11.2022..
//

import SwiftUI

// MARK: - Main View

struct SettingsView: View {
   @Environment(\.dismiss) var dismiss

   @State private var appSettings = AppSettings.shared
   @State private var presentLanguagePopup = false

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.settings) {
            dismiss()
         }

         ScrollViewIfNeeded {
            optionsView
            languagesView
            miscView
         }
      }
      .setupCommonModifiers(backgroundColor: Constants.Colors.bluewood, isPresented: presentLanguagePopup)
      .popup(isPresented: presentLanguagePopup, alignment: .center, direction: .top) {
         InfoPopupView(text: Constants.LocalisedString.languageInfo) {
            presentLanguagePopup.toggle()
         }
      }
   }
}

// MARK: - View Parts

extension SettingsView {
   private var optionsView: some View {
      Section {
         // Dark Mode
         ToggleRowView(
            name: Constants.LocalisedString.darkMode,
            onImageName: Constants.Images.moonFill,
            offImageName: Constants.Images.sunMaxFill,
            isOn: appSettings.appTheme == .dark
         ) { _ in
            let currentTheme = AppSettings.shared.appTheme
            AppSettings.shared.appTheme = currentTheme == .light ? .dark : .light
         }

         // Show Hint
         ToggleRowView(
            name: Constants.LocalisedString.showHint,
            onImageName: Constants.Images.lightbulbFill,
            offImageName: Constants.Images.lightbulbSlashFill,
            isOn: GlobalSettings.showHint
         ) { showHint in
            GlobalSettings.showHint = showHint
         }

         // Difficulty Levels
         NavigationLink(destination: DifficultyView()) {
            DisclosureRowView(
               title: Constants.LocalisedString.difficultyLevels,
               trailingText: GlobalSettings.gameDifficulty.localised
            )
         }
      } header: {
         SectionHeaderView(text: Constants.LocalisedString.options)
            .padding(.bottom, 10)
      }
   }

   private var languagesView: some View {
      Section {
         // App Language
         NavigationLink(destination: AppLanguageView(appLanguage: $appSettings.appLanguage)) {
            DisclosureRowView(title: Constants.LocalisedString.application, trailingText: appSettings.appLanguage.localised)
         }

         // Words Language
         NavigationLink(destination: WordsLanguageView(wordsLanguage: $appSettings.wordsLanguage)) {
            DisclosureRowView(title: Constants.LocalisedString.words, trailingText: appSettings.wordsLanguage.localised)
         }
      } header: {
         SectionHeaderView(text: Constants.LocalisedString.language, withInfo: true) {
            presentLanguagePopup.toggle()
         }
         .padding(.top, 20)
         .padding(.bottom, 10)
      }
   }

   private var miscView: some View {
      Section {
         // List of all words
         NavigationLink(destination: WordsListView()) {
            DisclosureRowView(title: Constants.LocalisedString.listOfAllWords)
         }
      } header: {
         SectionHeaderView(text: Constants.LocalisedString.misc)
            .padding(.top, 20)
            .padding(.bottom, 10)
      }
   }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView()
   }
}
