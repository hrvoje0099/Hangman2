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
}

enum Theme: Int {
   case light
   case dark

   var colorScheme: ColorScheme {
      switch self {
      case .light:
         return .light
      case .dark:
         return .dark
      }
   }
}
