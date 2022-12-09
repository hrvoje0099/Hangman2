//
// AppSettings
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

class AppSettings: ObservableObject {
   static let shared = AppSettings()
   @AppStorage("current_theme") var currentTheme: Theme = .dark
   @AppStorage("current_lang") var currentLang: Language = .english
}
