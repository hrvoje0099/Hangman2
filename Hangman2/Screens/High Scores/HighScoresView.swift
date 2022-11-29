//
// HighScoresView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct HighScoresView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   
   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.highScores) {
            self.presentationMode.wrappedValue.dismiss()
         }

         Section {
            ForEach((1...5).reversed(), id: \.self) { _ in
               HStack {
                  VStack {
                     Text("DATE")
                        .font(Font.custom("PatrickHand-Regular", size: 14))
                     Text("01.01.22")
                        .font(Font.custom("PatrickHand-Regular", size: 20))
                  }
                  Spacer()
                  VStack {
                     Text("SCORE")
                        .font(Font.custom("PatrickHand-Regular", size: 14))
                     Text("3500")
                        .font(Font.custom("PatrickHand-Regular", size: 20))
                  }
                  Spacer()
                  VStack {
                     Text("RATIO")
                        .font(Font.custom("PatrickHand-Regular", size: 14))
                     Text("15/05")
                        .font(Font.custom("PatrickHand-Regular", size: 20))
                  }
                  Spacer()
                  VStack {
                     Text("DIFFICULTY")
                        .font(Font.custom("PatrickHand-Regular", size: 14))
                     Text("Easy")
                        .font(Font.custom("PatrickHand-Regular", size: 20))
                  }
                  Spacer()
                  VStack {
                     Text("TIME TAKEN")
                        .font(Font.custom("PatrickHand-Regular", size: 14))
                     Text("23m 41s")
                        .font(Font.custom("PatrickHand-Regular", size: 20))
                  }
               }
               .padding([.leading, .trailing], 25)
               .padding([.top, .bottom], 5)
               .background(Constants.Colors.seeDeepBlue)
            }
         } header: {
            SectionHeaderView(name: Constants.LocalisedString.topFiveScores)
               .padding(SettingsConst.sectionPadding)
         }

         NavigationLink(destination: StatisticsView()) {
            TextButton(text: Constants.LocalisedString.statistics, font: Constants.Fonts.dangerL, color: Constants.Colors.carnationRed, textColor: .white) //{}
         }
         .padding(25)

         Spacer()
      }
      .background(Constants.Colors.woodBlue)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }
}

struct HighScoresView_Previews: PreviewProvider {
   static var previews: some View {
      HighScoresView()
   }
}
