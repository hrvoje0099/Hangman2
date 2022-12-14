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

   @State private var isShowHint = false
   @State private var presentLanguagePopup = false

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.settings) {
            dismiss()
         }

         ScrollViewIfNeeded {
            Options()
            Languages(presentPopup: $presentLanguagePopup)
            Misc()
         }
      }
      .background(Constants.Colors.bluewood)
      .navigationBarBackButtonHidden()
      .blur(radius: presentLanguagePopup ? 3 : 0)
      .disabled(presentLanguagePopup)
      .popup(isPresented: presentLanguagePopup, alignment: .center, direction: .top) {
         InfoPopupView(text: Constants.LocalisedString.languageInfo) {
            presentLanguagePopup.toggle()
         }
      }
   }
}

// MARK: - View Parts

struct Options: View {
   @StateObject private var appSettings = AppSettings.shared

   var body: some View {
      Section {
         // Dark Mode
         ToggleRowView(
            name: Constants.LocalisedString.darkMode,
            onImageName: Constants.Images.moonFill,
            offImageName: Constants.Images.sunMaxFill,
            bindValue: AppSettings.shared.appTheme == .dark
         ) { _ in
            let currentTheme = AppSettings.shared.appTheme
            AppSettings.shared.appTheme = currentTheme == .light ? .dark : .light
         }

         // Show Hint
         ToggleRowView(
            name: Constants.LocalisedString.showHint,
            onImageName: Constants.Images.lightbulbFill,
            offImageName: Constants.Images.lightbulbSlashFill,
            bindValue: GlobalSettings.showHint
         ) { showHint in
            GlobalSettings.showHint = showHint
         }

         // Difficulty Levels
         NavigationLink(destination: DifficultyView(gameDifficulty: $appSettings.gameDifficulty)) {
            DisclosureRowView(
               title: Constants.LocalisedString.difficultyLevels,
               trailingText: appSettings.gameDifficulty.localised
            )
         }
      } header: {
         SectionHeaderView(text: Constants.LocalisedString.options)
            .padding(.bottom, 10)
      }
   }
}

struct Languages: View {
   @Binding var presentPopup: Bool

   @StateObject private var appSettings = AppSettings.shared

   var body: some View {
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
            presentPopup.toggle()
         }
         .padding(.top, 20)
         .padding(.bottom, 10)
      }
   }
}

struct Misc: View {
   var body: some View {
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
