//
// EmailComposerView
// Hangman2
//
// Created by Hrvoje
//

import MessageUI
import SwiftUI

enum EmailType {
   case reportBug
   case featureRequest

   var subject: String {
      switch self {
      case .reportBug:
         return "Report Bug - Hangman"
      case .featureRequest:
         return "Feature Request - Hangman"
      }
   }

   var recipients: [String]? {
      switch self {
      case .reportBug:
         return ["vukovic.hrvoje@icloud.com"]
      case .featureRequest:
         return ["vukovic.hrvoje@icloud.com"]
      }
   }
}

struct EmailComposerView: UIViewControllerRepresentable {

   // EmailComposerView instance will be presented in modal sheet, and the 'presentationMode'
   //    environment property will let us dismiss it easily.
   @Environment(\.presentationMode) private var presentationMode

   // The 'emailData' will be containing any predefined values and data
   //    to feed the MFMailComposeViewController instance with.
   let emailData: EmailType

   // The 'result' property is a closure that will be indicating either the
   //    email sending result, or any error that was potentially occurred.
   var result: (Result<MFMailComposeResult, Error>) -> Void

   // Place were we initialise, configure, and return a MFMailComposeViewController instance.
   func makeUIViewController(context: Context) -> MFMailComposeViewController {
      let emailComposer = MFMailComposeViewController()
      emailComposer.mailComposeDelegate = context.coordinator
      emailComposer.setSubject(emailData.subject)
      emailComposer.setToRecipients(emailData.recipients)
      return emailComposer
   }

   // Place where changes coming from SwiftUI trigger update to the view controller.
   func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) { }

   static func canSendEmail() -> Bool {
      MFMailComposeViewController.canSendMail()
   }

   func makeCoordinator() -> Coordinator {
      Coordinator(self)
   }

   class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
      var parent: EmailComposerView

      init(_ parent: EmailComposerView) {
         self.parent = parent
      }

      func mailComposeController(
         _ controller: MFMailComposeViewController,
         didFinishWith result: MFMailComposeResult,
         error: Error?
      ) {
         if let error = error {
            parent.result(.failure(error))
            return
         }

         parent.result(.success(result))
         parent.presentationMode.wrappedValue.dismiss()
      }
   }
}
