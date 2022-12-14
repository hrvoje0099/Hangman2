//
// SegmentedProgressView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct SegmentedProgressView: View {
   let progress: Double
   let length: Int
   var startColor = Constants.Colors.carnation
   var endColor = Constants.Colors.mintLeaf
   var spaceColor = Constants.Colors.seaDeep
   var backgroundColor = Constants.Colors.azulPetroleo
   var height = CGFloat(10)

   @ViewBuilder
   var dividerLine: some View {
      Rectangle()
         .fill(spaceColor)
         .frame(width: 2, height: self.height)
   }

   var body: some View {
      GeometryReader { geo in
         ZStack {
            Capsule()
               .fill(backgroundColor)
               .frame(height: self.height)

            Rectangle()
               .fill(
                  LinearGradient(
                     gradient: Gradient(
                        stops: [.init(color: startColor, location: 0.30), .init(color: endColor, location: 0.60)]
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

// MARK: - Preview

struct SegmentedProgressView_Previews: PreviewProvider {
   static var previews: some View {
      SegmentedProgressView(
         progress: 100,
         length: 6,
         startColor: Constants.Colors.carnation,
         endColor: Constants.Colors.mintLeaf,
         spaceColor: Constants.Colors.seaDeep,
         backgroundColor: Constants.Colors.azulPetroleo
      )
      .padding()
      .background(Constants.Colors.seaDeep)
   }
}
