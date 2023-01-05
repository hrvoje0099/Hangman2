//
// WinRateCoreData
// Hangman2
//
// Created by Hrvoje
//

import CoreData
import Foundation

final class WinRateCoreData: NSObject, ObservableObject {
   @Published var winRateModel = [WinRateModel]()

   private let fetchedResultsController: NSFetchedResultsController<WinRate>

   private (set) var context: NSManagedObjectContext

   init(context: NSManagedObjectContext) {
      self.context = context
      self.fetchedResultsController = NSFetchedResultsController(fetchRequest: WinRate.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
      super.init()
      self.fetchedResultsController.delegate = self
      load()
   }

   func save(isWin: Bool) {
      do {
         let winRate = WinRate(context: context)
         winRate.difficulty = Int16(GlobalSettings.gameDifficulty.rawValue)
         winRate.isWin = isWin

         try context.save()
      } catch {
         print("❌ Save Win Rate: \(error)")
      }
   }

   // MARK: - Helper Methods

   private func load() {
      do {
         try fetchedResultsController.performFetch()
         guard let winRates = fetchedResultsController.fetchedObjects else { return }
         self.winRateModel = winRates.map(WinRateModel.init)
      } catch {
         print(error)
      }
   }
}

extension WinRateCoreData: NSFetchedResultsControllerDelegate {
   func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
      guard let winRates = controller.fetchedObjects as? [WinRate] else { return }

      self.winRateModel = winRates.map(WinRateModel.init)
   }
}
