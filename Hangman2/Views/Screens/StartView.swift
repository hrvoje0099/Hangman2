//
//  StartView.swift
//  Hangman2
//
//  Created by Hrvoje Vuković on 03.11.2022..
//

import SwiftUI

// MARK: - Main View

struct StartView: View {
   @State private var path = NavigationPath()

   var body: some View {
      NavigationStack(path: $path) {
         ZStack {
            BackgroundImageView(imageName: Constants.Images.backgroundStart)
            VStack {
               HeaderButtons()
               Spacer()
               Logo()
               Spacer()
               GameButtons(path: $path)
            }
         }
      }
   }
}

// MARK: - View Parts

struct HeaderButtons: View {
   var body: some View {
      VStack {
         HStack {
            VStack(alignment: .leading) {
               #warning("""
               Nad ovim NavigationLink-ovima kada implementiramo ViewModel mozemo dodati factory za kreiranje destination views-a. Isto vrijedi i za game buttons-e dolje.
               Primjer u clanku 'Avoiding massive SwiftUI views'
               """)
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

struct Logo: View {
   var body: some View {
      Image(Constants.Images.logoAppName)
      Spacer()
   }
}

struct GameButtons: View {
   @Binding var path: NavigationPath

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

// MARK: - Previews

struct StartView_Previews: PreviewProvider {
   static var previews: some View {
      StartView()
   }
}
