//
// BackImageButton
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct BackImageButton: View {
   let action: () -> Void

   var body: some View {
      Button {
         action()
      } label: {
         Image(Constants.Images.back)
            .frame(width: 48, height: 36)
      }
   }
}
struct BackImageButton_Previews: PreviewProvider {
    static var previews: some View {
       BackImageButton {}
    }
}
