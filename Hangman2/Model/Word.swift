//
// Word
// Hangman2
//
// Created by Hrvoje
//

import Foundation

struct Word: Codable, Identifiable, Hashable {
   let id = UUID()
   var word: String
   var hint: String
   var difficulty: Difficulty

   enum CodingKeys: CodingKey {
      case word
      case hint
      case difficulty
   }
}
