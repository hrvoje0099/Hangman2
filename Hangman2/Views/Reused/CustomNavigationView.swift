//
// CustomNavigationView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CustomNavigationView: View {
   let title: LocalizedStringKey
   let action: () -> Void

   var body: some View {
      HStack {
         BackImageButton {
            action()
         }
         Spacer()
         Text(title)
            .font(Constants.Fonts.patrickHandL)
            .foregroundColor(Constants.Colors.galeForce)
            .textCase(.uppercase)
         Spacer()
      }
      .padding(EdgeInsets(top: 20, leading: 0, bottom: 15, trailing: 40))
      .background(Constants.Colors.bluewood)
   }
}

struct CustomNavigationView_Previews: PreviewProvider {
   static var previews: some View {
      CustomNavigationView(title: "title") {}
   }
}
