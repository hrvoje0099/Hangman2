//
// SegmentedProgressView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct SegmentedProgressView: View {
   var progress: Double
   var length: Int
   var startColor: Color
   var endColor: Color
   var spaceColor: Color
   var backgroundColor: Color
   var height = CGFloat(10)

   @ViewBuilder
   var dividerLine: some View {
      Rectangle()
         .fill(spaceColor.opacity(2))
         .frame(width: 4, height: self.height)
   }

   var body: some View {
      GeometryReader { geo in
         ZStack() {
            Capsule()
               .fill(backgroundColor)
               .frame(height: self.height)

            Rectangle()
               .fill(
                  LinearGradient(
                     gradient: Gradient(
                        stops: [.init(color: startColor, location: 0.33), .init(color: endColor, location: 0.66)]
                     ),
                     startPoint: .leading,
                     endPoint: .trailing
                  )
               )
               .frame(height: self.height)
               .mask(alignment: .leading) {
                  Capsule()
                     .frame(height: self.height)
                     .frame(maxWidth: geo.size.width * (progress / 100), alignment: .leading)
               }

            HStack {
               Spacer()
               ForEach(1..<length, id: \.self) { _ in
                  dividerLine
                  Spacer()
               }
            }

         }
         .frame(height: self.height)
      }
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      SegmentedProgressView(
         progress: 100,
         length: 6,
         startColor: Constants.Colors.carnationRed,
         endColor: Constants.Colors.mintLeaf,
         spaceColor: Constants.Colors.seeDeepBlue,
         backgroundColor: Constants.Colors.toggleBackground
      )
      .padding()
      .background(Constants.Colors.seeDeepBlue)
   }
}
