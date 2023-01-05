//
// CoreDataManager
// Hangman2
//
// Created by Hrvoje
//

import CoreData
import Foundation

class CoreDataManager {
   static let shared = CoreDataManager()

   let persistentContainer: NSPersistentContainer

   private init() {
      persistentContainer = NSPersistentContainer(name: "DataModel")
      persistentContainer.loadPersistentStores { _, error in
         if let error {
            fatalError("Unable to init Core Data \(error)")
         }
      }
   }
}
