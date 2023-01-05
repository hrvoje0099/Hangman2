//
//  StartView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 03.11.2022..
//

import SwiftUI

// MARK: - Main View

struct StartView: View {
   @EnvironmentObject private var appModel: AppModel

   @State private var infoMessage = ""
   @State private var presentInfoPopup = false

   var body: some View {
      NavigationStack {
         ZStack {
            BackgroundImageView(imageName: Constants.Images.backgroundStart)
            VStack {
               HeaderButtons()
               Spacer()
               Logo()
               Spacer()
               GameButtons()
            }
         }
      }
      .setupCommonModifiers(backgroundColor: .clear, blurValue: 10, isPresented: (presentInfoPopup || appModel.showProgress))
      .onReceive(appModel.$errorMessage) { errorMessage in
         if !errorMessage.isEmpty {
            infoMessage = errorMessage
            presentInfoPopup.toggle()
         }
      }
      .popup(isPresented: presentInfoPopup, alignment: .center, direction: .top) {
         InfoPopupView(text: LocalizedStringKey(infoMessage)) {
            presentInfoPopup.toggle()
         }
      }
      .popup(isPresented: appModel.showProgress, alignment: .center, direction: .top) {
         ActivityIndicator()
      }
      .task {
         appModel.getAllWords()
      }
   }
}

// MARK: - View Parts

private struct HeaderButtons: View {
   var body: some View {
      VStack {
         HStack {
            VStack(alignment: .leading) {
               NavigationLink(destination: StatisticsView()) {
                  Image(Constants.Images.statistics)
               }
               NavigationLink(destination: HighScoresView()) {
                  Image(Constants.Images.highScores)
               }
            }
            Spacer()
            VStack(alignment: .trailing) {
               NavigationLink(destination: AboutView()) {
                  Image(Constants.Images.about)
               }
               NavigationLink(destination: SettingsView()) {
                  Image(Constants.Images.settings)
               }
            }
         }
         .padding([.leading, .trailing, .top], 20)
      }
   }
}

private struct Logo: View {
   var body: some View {
      Image(Constants.Images.logoAppName)
      Spacer()
   }
}

private struct GameButtons: View {
   var body: some View {
      VStack(spacing: 30) {
         NavigationLink(destination: GameView()) {
            TextButton(
               text: Constants.LocalisedString.play,
               font: Constants.Fonts.dangerXL,
               maxWidth: 300,
               outsidePadding: 0,
               isActionEnabled: false
            )
         }

         NavigationLink(destination: GameView()) {
            TextButton(
               text: Constants.LocalisedString.twoPlayers,
               font: Constants.Fonts.dangerL,
               backgroundColor: Constants.Colors.blueHeath,
               shadowColor: Constants.Colors.purpleHeart,
               maxWidth: 200,
               outsidePadding: 0,
               isActionEnabled: false
            )
         }
      }
      .padding(.bottom, 50)
   }
}
