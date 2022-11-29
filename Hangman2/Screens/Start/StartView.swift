//
//  StartView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 03.11.2022..
//

import SwiftUI

struct StartView: View {
   var body: some View {
      NavigationView {
         ZStack {
            Image(Constants.Images.startBackground)
               .resizable()
               .ignoresSafeArea()

            GeometryReader { geometry in
               let screenWidth = geometry.size.width

               VStack {
                  // MARK: - Header buttons
                  HStack {
                     NavigationLink(destination: HighScoresView()) {
                        Image(Constants.Images.highScores)
                           .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
                     }
                     Spacer()
                     NavigationLink(destination: SettingsView()) {
                        Image(Constants.Images.settings)
                           .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 20))
                     }
                  }

                  // MARK: - Logo
                  Spacer()

                  // iPhone SE 1st, iPhone 5, etc.
                  if screenWidth <= 320 {
                     Image(Constants.Images.logoAppName)
                        .resizable()
                        .frame(width: 250, height: 100, alignment: .center)
                  } else {
                     Image(Constants.Images.logoAppName)
                     Spacer()
                  }

                  // MARK: - Game buttons
                  Spacer()
                  VStack(spacing: 30) {
                     TextButton(text: Constants.LocalisedString.play, font: Constants.Fonts.dangerXL, color: Constants.Colors.carnationRed, textColor: .white) //{}
                     .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                     TextButton(text: Constants.LocalisedString.twoPlayers, font: Constants.Fonts.dangerL, textColor: .white) //{}
                     .padding(EdgeInsets(top: 0, leading: 60, bottom: 0, trailing: 60))
                  }
                  .padding(.bottom, 50)
               }
            }
         }
      }
   }
}

struct StartView_Previews: PreviewProvider {
   static var previews: some View {
      StartView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
         .previewDisplayName("iPhone 14 Pro")

      StartView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
         .previewDisplayName("iPhone 14 Pro Max")

      StartView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 14 Plus"))
         .previewDisplayName("iPhone 14 +")

      StartView()
         .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
         .previewDisplayName("iPhone 14")

      StartView()
         .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
         .previewDisplayName("iPhone SE (3rd)")

      StartView()
         .previewDevice(PreviewDevice(rawValue: "iPhone SE (1st generation)"))
         .previewDisplayName("iPhone SE (1st)")
   }
}
