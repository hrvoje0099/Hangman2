//
// AboutView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI
import UIKit
import MessageUI

// MARK: - Main View

struct AboutView: View {
   @Environment(\.dismiss) var dismiss

   @State private var showInfoPopup = false
   @State private var infoMessage = LocalizedStringKey("")

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.about) {
            dismiss()
         }

         ScrollViewIfNeeded {
            PortraitImage()
            GameInfo()
            ContactReportInfo(showInfoPopup: $showInfoPopup, infoMessage: $infoMessage)
            ContactMe()
            DevelopmentProcess()
         }
      }
      .groupedViewSetupWhereIsPopup(backgroundColor: Constants.Colors.bluewood, isPresented: showInfoPopup)
      .popup(isPresented: showInfoPopup, alignment: .center, direction: .top) {
         InfoPopupView(text: infoMessage) {
            showInfoPopup.toggle()
         }
      }
   }
}

// MARK: - View Parts

struct PortraitImage: View {
   var body: some View {
      Image(Constants.Images.mePortrait)
         .resizable()
         .scaledToFill()
         .frame(width: 140, height: 140)
         .clipped()
         .cornerRadius(70)
   }
}

struct GameInfo: View {
   var body: some View {
      Group {
         Text(Bundle.main.appName)
            .padding(.top, 20)
            .font(Constants.Fonts.patrickHandM)
            .foregroundColor(Constants.Colors.watermelon)

         Text("\(Bundle.main.appVersionLong) (\(Bundle.main.appBuild))")
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)
      }
   }
}

struct ContactReportInfo: View {
   @State private var showReportBugEmailComposer = false
   @State private var showFeatureRequestEmailComposer = false

   @Binding var showInfoPopup: Bool
   @Binding var infoMessage: LocalizedStringKey

   var body: some View {
      Group {
         Text(Constants.LocalisedString.contactReportInfo)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)

         HStack {
            TextButton(
               text: Constants.LocalisedString.reportBug,
               font: Constants.Fonts.patrickHandS,
               isShadowVisible: false,
               outsidePadding: 0
            ) {
               canDeviceSendEmail(type: .reportBug)
            }
            .emailComposer(isPresented: $showReportBugEmailComposer, emailData: .reportBug) { result in
               handleEmailComposeResult(result)
            }

            TextButton(
               text: Constants.LocalisedString.featureRequest,
               font: Constants.Fonts.patrickHandS,
               textColor: Constants.Colors.galeForce,
               backgroundColor: Constants.Colors.limedSpruce,
               isShadowVisible: false,
               outsidePadding: 0
            ) {
               canDeviceSendEmail(type: .featureRequest)
            }
            .emailComposer(isPresented: $showFeatureRequestEmailComposer, emailData: .featureRequest) { result in
               handleEmailComposeResult(result)
            }
         }
         .padding([.leading, .trailing], 20)

         Divider()
            .overlay(Constants.Colors.galeForce)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
      }
   }

   // Helper Methods

   private func canDeviceSendEmail(type: EmailType) {
      if EmailComposerView.canSendEmail() {
         switch type {
         case .reportBug:
            showReportBugEmailComposer = true
         case .featureRequest:
            showFeatureRequestEmailComposer = true
         }
      } else {
         infoMessage = Constants.LocalisedString.unableToSendEmail
         showInfoPopup = true
      }
   }

   private func handleEmailComposeResult(_ result: Result<MFMailComposeResult, Error>) {
      switch result {
      case .success(let status):
         switch status {
         case .cancelled:
            infoMessage = Constants.LocalisedString.emailStatusCancelled
         case .saved:
            infoMessage = Constants.LocalisedString.emailStatusSaved
         case .sent:
            infoMessage = Constants.LocalisedString.emailStatusSent
         case .failed:
            infoMessage = Constants.LocalisedString.emailStatusFailed
         @unknown default:
            infoMessage = Constants.LocalisedString.emailStatusUnknown
         }

      case .failure(let error):
         infoMessage = "\(error.localizedDescription)"
      }

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
         showInfoPopup = true
      }
   }
}

struct ContactMe: View {
   var body: some View {
      Group {
         Text(Constants.LocalisedString.contactMe)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         VStack {
            HStack(spacing: 30) {
               if let gitHubUrl = URL(string: Constants.Links.gitHub) {
                  Link(destination: gitHubUrl) {
                     ShapeButton(text: Constants.NonLocalisedString.gitHub, image: Constants.Images.github)
                  }
               }
               if let linkedInUrl = URL(string: Constants.Links.linkedIn) {
                  Link(destination: linkedInUrl) {
                     ShapeButton(text: Constants.NonLocalisedString.linkedIn, image: Constants.Images.linkedIn)
                  }
               }
            }
            .padding(EdgeInsets(top: -10, leading: 40, bottom: 0, trailing: 20))

            HStack(spacing: 30) {
               if let twitterUrl = URL(string: Constants.Links.twitter) {
                  Link(destination: twitterUrl) {
                     ShapeButton(text: Constants.NonLocalisedString.twitter, image: Constants.Images.twitter)
                  }
               }
               if let instagramUrl = URL(string: Constants.Links.instagram) {
                  Link(destination: instagramUrl) {
                     ShapeButton(text: Constants.NonLocalisedString.instagram, image: Constants.Images.instagram)
                  }
               }
            }
            .padding(EdgeInsets(top: -10, leading: 40, bottom: 0, trailing: 20))
         }

         Divider()
            .overlay(Constants.Colors.galeForce)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
      }
   }
}

struct DevelopmentProcess: View {
   var body: some View {
      Group {
         Text(Constants.LocalisedString.appDevelopmentProcess)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         HStack(spacing: 30) {
            if let youTubeUrl = URL(string: Constants.Links.youTube) {
               Link(destination: youTubeUrl) {
                  ShapeButton(text: Constants.NonLocalisedString.youtube, image: Constants.Images.youtube)
               }
            }
            if let blogUrl = URL(string: Constants.Links.blog) {
               Link(destination: blogUrl) {
                  ShapeButton(text: Constants.NonLocalisedString.blog, image: Constants.Images.website)
               }
            }
         }
         .padding(EdgeInsets(top: -10, leading: 40, bottom: 0, trailing: 20))
      }
   }
}

// MARK: - Previews

struct AboutView_Previews: PreviewProvider {
   static var previews: some View {
      AboutView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
         .environment(\.locale, .init(identifier: "hr"))

      AboutView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
         .previewDisplayName("iPhone 14 Pro")
         .environment(\.locale, .init(identifier: "eb"))
   }
}
