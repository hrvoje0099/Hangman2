//
// WinRate+Extensions
// Hangman2
//
// Created by Hrvoje
//

import CoreData
import Foundation

extension WinRate {
   static var all: NSFetchRequest<WinRate> {
      let request = WinRate.fetchRequest()
      request.sortDescriptors = []
      return                                                         request
   }
}
