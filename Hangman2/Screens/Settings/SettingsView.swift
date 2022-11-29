//
//  SettingsView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 08.11.2022..
//

import SwiftUI

enum SettingsConst {
   static let sectionPadding = EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)
}

struct SettingsView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

   @State private var isShowHint = false

   // MARK: - Body

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.settings) {
            self.presentationMode.wrappedValue.dismiss()
         }

         ScrollView {
            Section {
               ToggleRowView(
                  name: Constants.LocalisedString.darkMode, onImageName: Constants.Images.moonFill,
                  offImageName: Constants.Images.sunMaxFill, bindValue: AppSettings.shared.currentTheme == .dark
               ) {
                  let currentTheme = AppSettings.shared.currentTheme
                  AppSettings.shared.currentTheme = currentTheme == .light ? .dark : .light
               }

               ToggleRowView(
                  name: Constants.LocalisedString.showHint, onImageName: Constants.Images.lightbulbFill,
                  offImageName: Constants.Images.lightbulbSlashFill, bindValue: isShowHint
               ) {}

               NavigationLink(destination: DifficultyView()) {
                  DisclosureRowView(title: Constants.LocalisedString.difficultyLevel, trailingText: LocalizedStringKey(GlobalSettings.gameDifficulty.localised))
               }
            } header: {
               SectionHeaderView(name: Constants.LocalisedString.options)
                  .padding(SettingsConst.sectionPadding)
            }

            Section {
               DisclosureRowView(title: Constants.LocalisedString.application, trailingText: getApplicationLanguage())
                  .onTapGesture {
                     UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                  }

               NavigationLink(destination: LanguageView()) {
                  DisclosureRowView(title: Constants.LocalisedString.words, trailingText: LocalizedStringKey(GlobalSettings.wordsLanguage.localised))
               }
            } header: {
               SectionHeaderView(name: Constants.LocalisedString.language)
                  .padding(SettingsConst.sectionPadding)
            }

            Section {
               NavigationLink(destination: WordsListView()) {
                  DisclosureRowView(title: Constants.LocalisedString.listOfAllWords)
               }

               NavigationLink(destination: AboutView()) {
                  DisclosureRowView(title: Constants.LocalisedString.about)
               }
            } header: {
               SectionHeaderView(name: Constants.LocalisedString.misc)
                  .padding(SettingsConst.sectionPadding)
            }

         }
      }
      .background(Constants.Colors.woodBlue)
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
