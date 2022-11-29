//
// TextButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct TextButton: View {
   var text: String
   var font: Font
   var color: Color?
   var textColor: Color?
//   var action: () -> Void
   
    var body: some View {
       Text(LocalizedStringKey(text))
          .padding([.top, .bottom], 7)
          .font(font)
          .frame(maxWidth: .infinity)
          .foregroundColor(textColor ?? Constants.Colors.textColor)
          .background(color ?? Color.accentColor)
          .cornerRadius(15)
//       Button {
////          action()
//       } label: {
//          Text(LocalizedStringKey(text))
//             .font(font)
//             .frame(maxWidth: .infinity)
//             .foregroundColor(textColor ?? Constants.Colors.textColor)
//       }
//       .buttonStyle(.borderedProminent)
//       .tint(color)
    }
}

struct TextButton_Previews: PreviewProvider {
    static var previews: some View {
       VStack {
          TextButton(text: "Text", font: Constants.Fonts.dangerXL, color: Constants.Colors.carnationRed)/* {
             print("With custom color.")
          }*/

          TextButton(text: "Text", font: Constants.Fonts.dangerXL) /*{
             print("With default color.")
          }*/
       }
    }
}
