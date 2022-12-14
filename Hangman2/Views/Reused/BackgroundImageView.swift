//
// BackgroundImageView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct BackgroundImageView: View {
   let imageName: String

   var body: some View {
      Image(imageName)
         .resizable()
         .ignoresSafeArea()
   }
}

// MARK: - Preview

struct BackgroundImageView_Previews: PreviewProvider {
   static var previews: some View {
      BackgroundImageView(imageName: Constants.Images.backgroundStart)
   }
}
