//
// HighScoreModel
// Hangman2
//
// Created by Hrvoje
//

import CoreData
import Foundation
import SwiftUI

struct HighScoreModel: Identifiable {
   private var highScore: HighScore

   init(highScore: HighScore) {
      self.highScore = highScore
   }

   var id: NSManagedObjectID {
      highScore.objectID
   }

   var date: String {
      highScore.date?.formatted(
         .dateTime.day().month(.defaultDigits).year(.twoDigits)
      ) ?? ""
   }

   var score: Int {
      Int(highScore.score)
   }

   var ratio: String {
      "\(highScore.wins)\\\(highScore.losses)"
   }

   var difficulty: LocalizedStringKey {
      switch highScore.difficulty {
      case 1: return Difficulty.easy.localised
      case 2: return Difficulty.medium.localised
      case 3: return Difficulty.hard.localised
      default: return ""
      }
   }

   var time: String {
      convertTimeToString(time: highScore.time)
   }

   // Convert the time into day:hour:min:sec (23:34:45:56) format.
   private func convertTimeToString(time: Int64) -> String {
      let day     = Int(time) / 86_400
      let hours   = Int(time) / 3600 % 24
      let minutes = Int(time) / 60 % 60
      let seconds = Int(time) % 60

      switch time {
      case 0..<60: return String(format: "%02is", seconds)
      case 60..<3600: return String(format: "%02im%02is", minutes, seconds)
      case 3600..<86_400: return  String(format: "%02ih%02im", hours, minutes, seconds)
      default: return String(format: "%02id%02ih", day, hours, minutes, seconds)
      }
   }
}
