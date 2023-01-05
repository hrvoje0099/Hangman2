//
// WinRateModel
// Hangman2
//
// Created by Hrvoje
//

import CoreData
import Foundation

struct WinRateModel: Identifiable {
   private var winRate: WinRate

   init(winRate: WinRate) {
      self.winRate = winRate
   }

   var id: NSManagedObjectID {
      winRate.objectID
   }

   var difficulty: Int {
      switch winRate.difficulty {
      case 1: return Difficulty.easy.rawValue
      case 2: return Difficulty.medium.rawValue
      case 3: return Difficulty.hard.rawValue
      default: return 0
      }
   }

   var isWin: Bool {
      winRate.isWin
   }
}
