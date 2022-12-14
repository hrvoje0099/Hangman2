//
// CharBox
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct CharBox: View {
   let text: String
   let width: CGFloat
   let action: () -> Void

   var body: some View {
      Button {
         action()
      } label: {
         Text(text)
            .frame(width: width, height: 40, alignment: .center)
            .background(Constants.Colors.azulPetroleo)
            .cornerRadius(10)
            .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
      }
   }
}

// MARK: - Preview

struct CharBox_Previews: PreviewProvider {
    static var previews: some View {
       CharBox(text: "A", width: 40) {}
    }
}
