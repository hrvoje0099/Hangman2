//
//  SettingsView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 08.11.2022..
//

import SwiftUI

struct SettingsView: View {
   @Environment(\.dismiss) var dismiss

   @State private var isShowHint = false
   @State private var presentLanguagePopup = false

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
               NavigationLink(destination: AppLanguageView()) {
                  DisclosureRowView(
                     title: Constants.LocalisedString.application,
                     trailingText: LocalizedStringKey(AppSettings.shared.currentLang.localised)
                  )
               }

               NavigationLink(destination: WordsLanguageView()) {
                  DisclosureRowView(
                     title: Constants.LocalisedString.words,
                     trailingText: LocalizedStringKey(GlobalSettings.wordsLanguage.localised)
                  )
               }
            } header: {
               SectionHeaderView(name: Constants.LocalisedString.language, withInfo: true) {
                  presentLanguagePopup.toggle()
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
      .blur(radius: presentLanguagePopup ? 3 : 0)
      .disabled(presentLanguagePopup)
      .popup(isPresented: presentLanguagePopup, alignment: .center, direction: .top) {
         LanguagePopupView {
            presentLanguagePopup.toggle()
         }
      }
   }
}

struct SettingsView_Previews: PreviewProvider {
   static var previews: some View {
      SettingsView()
   }
}
