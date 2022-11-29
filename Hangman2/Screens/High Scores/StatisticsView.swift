//
// StatisticsView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct StatisticsView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
   
   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.statistics) {
            self.presentationMode.wrappedValue.dismiss()
         }

         SectionHeaderView(name: "WIN RATE")

         HStack {
            CircularProgressView(progress: 0.50)
               .frame(width: 140, height: 140)
               .padding(18)

            VStack {
               VStack(spacing: 5) {
                  HStack {
                     Text("Difficulty: Easy")
                        .font(Constants.Fonts.patrickHandXS)
                     Spacer()
                     Text("100%")
                        .font(Constants.Fonts.patrickHandXS)
                  }
                  SegmentedProgressView(
                     progress: 100,
                     length: 6,
                     startColor: Constants.Colors.carnationRed,
                     endColor: Constants.Colors.mintLeaf,
                     spaceColor: Constants.Colors.seeDeepBlue,
                     backgroundColor: Constants.Colors.toggleBackground
                  )
               }

               Spacer()

               VStack(spacing: 5) {
                  HStack {
                     Text("Difficulty: Medium")
                        .font(Constants.Fonts.patrickHandXS)
                     Spacer()
                     Text("54%")
                        .font(Constants.Fonts.patrickHandXS)
                  }
                  SegmentedProgressView(
                     progress: 54,
                     length: 6,
                     startColor: Constants.Colors.carnationRed,
                     endColor: Constants.Colors.mintLeaf,
                     spaceColor: Constants.Colors.seeDeepBlue,
                     backgroundColor: Constants.Colors.toggleBackground
                  )
               }

               Spacer()

               VStack(spacing: 5) {
                  HStack {
                     Text("Difficulty: Hard")
                        .font(Constants.Fonts.patrickHandXS)
                     Spacer()
                     Text("25%")
                        .font(Constants.Fonts.patrickHandXS)
                  }
                  SegmentedProgressView(
                     progress: 25,
                     length: 6,
                     startColor: Constants.Colors.carnationRed,
                     endColor: Constants.Colors.mintLeaf,
                     spaceColor: Constants.Colors.seeDeepBlue,
                     backgroundColor: Constants.Colors.toggleBackground
                  )
               }
            }
            .frame(height: 140)
            .padding(.trailing, 15)

         }
         .frame(maxWidth: .infinity, alignment: .leading)
         .background(Constants.Colors.seeDeepBlue)
         .cornerRadius(15)
         .padding(EdgeInsets(top: 15, leading: 23, bottom: 0, trailing: 23))

         Spacer()
      }
      .background(Constants.Colors.woodBlue)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }
}

struct StatisticsView_Previews: PreviewProvider {
   static var previews: some View {
      StatisticsView()
   }
}
