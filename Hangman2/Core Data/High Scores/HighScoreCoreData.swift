//
// HighScoreCoreData
// Hangman2
//
// Created by Hrvoje
//

import CoreData
import Foundation
import SwiftUI

final class HighScoreCoreData: NSObject, ObservableObject {
   @Published var highScores = [HighScoreModel]()

   private let fetchedResultsController: NSFetchedResultsController<HighScore>

   private (set) var context: NSManagedObjectContext

   init(context: NSManagedObjectContext) {
      self.context = context
      self.fetchedResultsController = NSFetchedResultsController(fetchRequest: HighScore.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
      super.init()
      self.fetchedResultsController.delegate = self
      load()
   }

   func save(_ game: Game, with time: Int) {
      if highScores.count < 10 {
         saveGameInHighScores(game, with: time)
      } else {
         let newScore = game.score
         let lowestHighScore = highScores.min { $0.score < $1.score }
         if let lowestHighScore, newScore > lowestHighScore.score {
            saveGameInHighScores(game, with: time)
            delete(lowestHighScore)
         }
      }
   }

   // MARK: - Helper Methods

   private func load() {
      do {
         try fetchedResultsController.performFetch()
         guard let highScores = fetchedResultsController.fetchedObjects else { return }
         self.highScores = highScores.map(HighScoreModel.init)
      } catch {
         print(error)
      }
   }

   private func saveGameInHighScores(_ game: Game, with time: Int) {
      do {
         let highScore = HighScore(context: context)
         highScore.date = Date.now
         highScore.score = Int32(game.score)
         highScore.wins = Int16(game.wins)
         highScore.losses = Int16(game.losses)
         highScore.difficulty = Int16(GlobalSettings.gameDifficulty.rawValue)
         highScore.time = Int64(time)

         try context.save()
      } catch {
         print("❌ Save High Score: \(error)")
      }
   }

   private func delete(_ highScoreModel: HighScoreModel) {
      do {
         guard let highScore = try context.existingObject(with: highScoreModel.id) as? HighScore else { return }
         context.delete(highScore)
         try context.save()
      } catch {
         print("❌ Delete High Score: \(error)")
      }
   }
}

extension HighScoreCoreData: NSFetchedResultsControllerDelegate {
   func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      guard let highScores = controller.fetchedObjects as? [HighScore] else { return }

      self.highScores = highScores.map(HighScoreModel.init)
   }
}
