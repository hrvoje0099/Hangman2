//
// Game
// Hangman2
//
// Created by Hrvoje
//

import Foundation
import SwiftUI

final class Game: ObservableObject {
   let word: String
   let hint: String
   var parts: [WordPart]
   var score: Int
   var wins: Int
   var losses: Int
   var image: Int
   var isCorrectFinish: Bool

   init() {
      word = ""
      hint = ""
      parts = [WordPart(letter: "", isSelected: false)]
      score = 0
      wins = 0
      losses = 0
      image = 1
      isCorrectFinish = false
   }

   init(
      word: String,
      hint: String,
      parts: [WordPart],
      score: Int = 0,
      wins: Int = 0,
      losses: Int = 0,
      image: Int = 1,
      isFinished: Bool = false
   ) {
      self.word = word
      self.hint = hint
      self.parts = parts
      self.score = score
      self.wins = wins
      self.losses = losses
      self.image = image
      self.isCorrectFinish = isFinished
   }
}

final class WordPart: Identifiable {
   let id = UUID()
   var letter: String
   var isSelected: Bool

   init(letter: String, isSelected: Bool) {
      self.letter = letter
      self.isSelected = isSelected
   }
}
