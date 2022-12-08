//
// AboutView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct AboutView: View {
   @Environment(\.dismiss) var dismiss

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.about) {
            dismiss()
         }

         // MARK: - Portrait

         Image(Constants.Images.mePortrait)
            .resizable()
            .scaledToFill()
            .frame(width: 140, height: 140)
            .clipped()
            .cornerRadius(70)

         // MARK: - Game info

         Text(LocalizedStringKey(Constants.NonLocalisedString.appName))
            .frame(alignment: .leading)
            .padding(.top, 20)
            .font(Constants.Fonts.patrickHandM)
            .foregroundColor(Constants.Colors.watermelon)

         #warning("Hard coded")
         Text("1.0.0 (1)")
            .frame(alignment: .leading)
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)

         // MARK: - Report bug/feature

         Text(LocalizedStringKey(Constants.LocalisedString.contactReportInfo))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         HStack {
            TextButton(
               text: Constants.LocalisedString.reportBug,
               font: Constants.Fonts.patrickHandS,
               color: Constants.Colors.carnation,
               textColor: .white
            )

            TextButton(
               text: Constants.LocalisedString.featureRequest,
               font: Constants.Fonts.patrickHandS,
               color: Constants.Colors.limedSpruce
            )
         }
         .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

         Divider()
            .overlay(Constants.Colors.galeForce)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         // MARK: - Contact me

         Text(LocalizedStringKey(Constants.LocalisedString.contactMe))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHandS)
            .foregroundColor(Constants.Colors.galeForce)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         HStack(spacing: 30) {
            ShapeButton(text: Constants.NonLocalisedString.gitHub, image: Constants.Images.github) {}

            ShapeButton(text: Constants.NonLocalisedString.linkedIn, image: Constants.Images.linkedIn) {}
         }
         .padding(EdgeInsets(top: -10, leading: 40, bottom: 0, trailing: 20))

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }
}

struct AboutView_Previews: PreviewProvider {
   static var previews: some View {
      AboutView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
         .previewDisplayName("iPhone 13 mini")
         .environment(\.locale, .init(identifier: "hr"))
   }
}
