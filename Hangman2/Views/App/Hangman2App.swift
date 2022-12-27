//
//  Hangman2App.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 03.11.2022..
//

import SwiftUI

@main
struct Hangman2App: App {
   @ObservedObject var appSettings = AppSettings.shared

   private var model = WordModel(wordService: WordService())

   var body: some Scene {
      WindowGroup {
         StartView()
            .preferredColorScheme(appSettings.appTheme.colorScheme)
            .environment(\.locale, .init(identifier: appSettings.appLanguage.location))
            .environmentObject(model)
            .task {
               model.getAllWords()
            }
      }
   }
}
