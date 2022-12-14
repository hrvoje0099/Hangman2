//
// AppSettings
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

final class AppSettings: ObservableObject {
   static let shared = AppSettings()
   @AppStorage("app_theme") var appTheme: Theme = .dark
   @AppStorage("app_lang") var appLanguage: Language = .english
   @AppStorage("words_lang") var wordsLanguage: Language = .english
   @AppStorage("game_difficulty") var gameDifficulty: Difficulty = .medium
}
