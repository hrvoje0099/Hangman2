//
// Localized+SpreadString
// Hangman2
//
// Created by Hrvoje
//

import Foundation
import SwiftUI

extension LocalizedStringKey {
   var stringKey: String? {
      Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
   }
   
   func spreadLocalizedString() -> String {
      return .localizedString(for: self.stringKey ?? "", locale: .current).spreadString()
   }
}

extension String {
   static func localizedString(for key: String, locale: Locale = .current) -> String {
      let language = locale.language.languageCode?.identifier
      let path = Bundle.main.path(forResource: language, ofType: "lproj")!
      let bundle = Bundle(path: path)!
      let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
      
      return localizedString
   }
   
   func spreadString() -> String {
      self
         .map { "\($0) " }
         .joined()
   }
}
