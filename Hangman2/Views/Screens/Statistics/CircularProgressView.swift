//
// CircularProgressView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct CircularProgressView: View {
   let progressValue: Double
   var circleColor = Constants.Colors.azulPetroleo
   var strokeColor = Constants.Colors.mintLeaf
   var textFont = Constants.Fonts.patrickHandXL
   var textColor = Constants.Colors.galeForce

   @State private var progressState = CGFloat(0)

   var body: some View {
      let lineWidth = CGFloat(12)

      ZStack {
         Circle()
            .stroke(circleColor, lineWidth: lineWidth)
         Circle()
            .trim(from: 0, to: progressState)
            .stroke(strokeColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(Angle(degrees: -90))
            .modifier(
               AnimatingNumberOverlay(
                  number: progressState,
                  alignment: .center,
                  format: "%.f%%",
                  textFont: textFont,
                  textColor: textColor
               )
            )
      }
      .onAppear {
         withAnimation(.easeInOut(duration: 3)) {
            progressState = progressValue
         }
      }
   }
}

// MARK: - Preview

struct CircularProgressView_Previews: PreviewProvider {
   static var previews: some View {
      CircularProgressView(progressValue: 0.5)
   }
}
