//
// CharBox
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct CharBox: View {
   let letter: Letter
   let width: CGFloat
   let action: () -> Void

   var body: some View {
      Button {
         action()
      } label: {
         Text(letter.text)
            .frame(width: width, height: 40, alignment: .center)
            .background(letter.status.color)
            .cornerRadius(10)
            .shadow(color: Constants.Colors.ebonyClay, radius: 0, x: 0, y: 5)
            .textCase(.uppercase)
      }
      .disabled(letter.isDisabled)
   }
}

// MARK: - Preview

struct CharBox_Previews: PreviewProvider {
    static var previews: some View {
       let letterA = Letter(text: "a", isDisabled: false, status: .unselected)
       CharBox(letter: letterA, width: 40) {}
    }
}
