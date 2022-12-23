//
// Word
// Hangman2
//
// Created by Hrvoje
//

import Foundation

struct Word: Codable, Identifiable {
   let id = UUID()
   var word: String
   var hint: String
   var difficulty: Int

   enum CodingKeys: CodingKey {
      case word
      case hint
      case difficulty
   }
}
