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
   
   var body: some Scene {
      WindowGroup {
         StartView()
            .preferredColorScheme(appSettings.currentTheme.colorScheme)
      }
   }
}
