//
// String+Whitespaces
// Hangman2
//
// Created by Hrvoje
//

import Foundation

extension String {
   func convertToWhitespaces() -> String {
      String(repeating: " ", count: self.count)
   }
}
