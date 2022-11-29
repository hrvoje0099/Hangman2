//
// CustomNavigationView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CustomNavigationView: View {
   var title: String
   var action: () -> Void

    var body: some View {
       HStack {
          Button {
             action()
          } label: {
             Image(Constants.Images.back)
          }
          Spacer()
          Text(LocalizedStringKey(title).spreadLocalizedString())
             .font(Constants.Fonts.dangerM)
             .foregroundColor(Constants.Colors.textColor)


          Spacer()
       }
       .padding(EdgeInsets(top: 20, leading: 20, bottom: 15, trailing: 0))
       .background(Constants.Colors.woodBlue)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
       CustomNavigationView(title: "t i t l e") {
       }
    }
}

