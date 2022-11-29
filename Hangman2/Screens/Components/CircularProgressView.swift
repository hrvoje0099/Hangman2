//
// CircularProgressView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CircularProgressView: View {
   var progress: Double

   var body: some View {
      let lineWidth = CGFloat(12)
      let progressText = String(format: "%.1f%%", progress * 100)

      ZStack {
         Circle()
            .stroke(Constants.Colors.winRate, lineWidth: lineWidth)
         Circle()
            .trim(from: 0, to: CGFloat(self.progress))
            .stroke(Constants.Colors.mintLeaf, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(Angle(degrees: -90))
            .overlay(
               Text(progressText)
                  .font(Constants.Fonts.patrickHandXXXL)
                  .foregroundColor(Constants.Colors.textColor)
            )
      }
   }
}

struct CircularProgressView_Previews: PreviewProvider {
   static var previews: some View {
      CircularProgressView(progress: 0.5)
   }
}
