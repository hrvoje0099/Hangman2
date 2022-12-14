//
// EmailComposer
// Hangman2
//
// Created by Hrvoje
//

import MessageUI
import SwiftUI

struct EmailComposer: ViewModifier {
   @Binding var isPresented: Bool
   var emailData: EmailType
   var onDismiss: (() -> Void)?
   var result: (Result<MFMailComposeResult, Error>) -> Void

   func body(content: Content) -> some View {
      content
         .sheet(isPresented: $isPresented, onDismiss: onDismiss) {
            EmailComposerView(emailData: emailData) { result in
               self.result(result)
            }
         }
   }
}

extension View {
   func emailComposer(
      isPresented: Binding<Bool>,
      emailData: EmailType,
      onDismiss: (() -> Void)? = nil,
      result: @escaping (Result<MFMailComposeResult, Error>) -> Void
   ) -> some View {
      self.modifier(
         EmailComposer(isPresented: isPresented, emailData: emailData, onDismiss: onDismiss, result: result)
      )
   }
}
