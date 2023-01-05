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

   private var appModel = AppModel(
      wordService: WordService(),
      highScoreCoreData: HighScoreCoreData(context: CoreDataManager.shared.persistentContainer.viewContext),
      winRateCoreData: WinRateCoreData(context: CoreDataManager.shared.persistentContainer.viewContext)
   )

   var body: some Scene {
      WindowGroup {
         StartView()
            .preferredColorScheme(appSettings.appTheme.colorScheme)
            .environment(\.locale, .init(identifier: appSettings.appLanguage.location))
            .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
            .environmentObject(appModel)
            .task {
               appModel.getAllWords()
            }
      }
   }
}
