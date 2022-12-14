//
// CircularProgressView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct CircularProgressView: View {
   let progress: Double
   let circleColor: Color
   let strokeColor: Color
   let textFont: Font
   let textColor: Color

   init(
      progress: Double,
      circleColor: Color = Constants.Colors.azulPetroleo,
      strokeColor: Color = Constants.Colors.mintLeaf,
      textFont: Font = Constants.Fonts.patrickHandXL,
      textColor: Color = Constants.Colors.galeForce
   ) {
      self.progress = progress
      self.circleColor = circleColor
      self.strokeColor = strokeColor
      self.textFont = textFont
      self.textColor = textColor
   }

   var body: some View {
      let lineWidth = CGFloat(12)
      let progressText = String(format: "%.1f%%", progress * 100)

      ZStack {
         Circle()
            .stroke(circleColor, lineWidth: lineWidth)
         Circle()
            .trim(from: 0, to: CGFloat(self.progress))
            .stroke(strokeColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(Angle(degrees: -90))
            .overlay(
               Text(progressText)
                  .font(textFont)
                  .foregroundColor(textColor)
            )
      }
   }
}

// MARK: - Preview

struct CircularProgressView_Previews: PreviewProvider {
   static var previews: some View {
      CircularProgressView(progress: 0.5)
   }
}
