//
// CustomNavigationView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CustomNavigationView: View {
   let title: String
   let action: () -> Void

   var body: some View {
      HStack {
         Button {
            action()
         } label: {
            Image(Constants.Images.back)
         }
         Spacer()
         Text(LocalizedStringKey(title))
            .font(Constants.Fonts.patrickHandL)
            .foregroundColor(Constants.Colors.galeForce)
            .textCase(.uppercase)
         Spacer()
      }
      .padding(EdgeInsets(top: 20, leading: 20, bottom: 15, trailing: 20))
      .background(Constants.Colors.bluewood)
   }
}

struct CustomNavigationView_Previews: PreviewProvider {
   static var previews: some View {
      CustomNavigationView(title: "title") {}
   }
}
