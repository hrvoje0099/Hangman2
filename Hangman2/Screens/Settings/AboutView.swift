//
// AboutView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct AboutView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.about) {
            self.presentationMode.wrappedValue.dismiss()
         }

         Image(Constants.Images.logoAppMock)
            .resizable()
            .frame(width: 140, height: 140)

         Text(LocalizedStringKey(Constants.NonLocalisedString.appName))
            .frame(alignment: .leading)
            .padding(.top, 20)
            .font(Constants.Fonts.patrickHandL)
            .foregroundColor(Constants.Colors.watermelon)

         #warning("Hard coded")
         Text("1.0.0 (1)")
            .frame(alignment: .leading)
            .font(Constants.Fonts.patrickHand)
            .foregroundColor(Constants.Colors.textColor)

         Text(LocalizedStringKey(Constants.LocalisedString.contactReportInfo))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHand)
            .foregroundColor(Constants.Colors.textColor)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         HStack {
            TextButton(text: Constants.LocalisedString.reportBug, font: Constants.Fonts.patrickHand, color: Constants.Colors.carnationRed, textColor: .white) //{}

            TextButton(text: Constants.LocalisedString.featureRequest, font: Constants.Fonts.patrickHand, color: Constants.Colors.stoneGranit) //{}
         }
         .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

         Divider()
            .overlay(Constants.Colors.textColor)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         Text(LocalizedStringKey(Constants.LocalisedString.contactMe))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHand)
            .foregroundColor(Constants.Colors.textColor)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))

         HStack(spacing: 30) {
            ShapeButton(text: Constants.NonLocalisedString.gitHub, image: Constants.Images.github) {}

            ShapeButton(text: Constants.NonLocalisedString.linkedIn, image: Constants.Images.linkedIn) {}
         }
         .padding(EdgeInsets(top: -10, leading: 40, bottom: 0, trailing: 20))

         Spacer()
      }
      .background(Constants.Colors.woodBlue)
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
