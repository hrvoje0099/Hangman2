//
// GlobalSettings
// Hangman2
//
// Created by Hrvoje
//

import Foundation

enum GlobalSettings {
   @UserDefault(key: "showHint", defaultValue: false)
   static var showHint: Bool

   @UserDefault(key: "game_difficulty", defaultValue: .medium)
   static var gameDifficulty: Difficulty

   @UserDefault(key: "wins", defaultValue: 0)
   static var wins: Int

   @UserDefault(key: "losses", defaultValue: 0)
   static var losses: Int

   @UserDefault(key: "perfect_wins", defaultValue: 0)
   static var perfectWins: Int

   @UserDefault(key: "longest_game", defaultValue: 0)
   static var longestGame: Int

   @UserDefault(key: "total_time", defaultValue: 0)
   static var totalTime: Int
}

@propertyWrapper
struct UserDefault<T: Codable> {
   struct Wrapper<T>: Codable where T: Codable {
      let wrapped: T
   }

   let key: String
   let defaultValue: T

   init(key: String, defaultValue: T) {
      self.key = key
      self.defaultValue = defaultValue
   }

   var wrappedValue: T {
      get {
         guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return defaultValue }
         let value = try? JSONDecoder().decode(Wrapper<T>.self, from: data)
         return value?.wrapped ?? defaultValue
      }
      set {
         do {
            let data = try JSONEncoder().encode(Wrapper(wrapped: newValue))
            UserDefaults.standard.set(data, forKey: key)
         } catch {
            print("GlobalSettings set error: \(error)")
         }
      }
   }
}
