//
// HighScore+Extensions
// Hangman2
//
// Created by Hrvoje
//

import CoreData
import Foundation

extension HighScore {
   static var all: NSFetchRequest<HighScore> {
      let request = HighScore.fetchRequest()
      request.sortDescriptors = [NSSortDescriptor(key: "score", ascending: false)]
      return request
   }
}
