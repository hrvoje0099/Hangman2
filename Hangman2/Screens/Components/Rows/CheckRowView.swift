//
// CheckRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CheckRowView: View {
   @Environment(\.dismiss) var dismiss

   let title: String
   @State var isSelected: Bool
   let action: () -> Void

   var body: some View {
      HStack {
         Text(LocalizedStringKey(title))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHand)
            .foregroundColor(Constants.Colors.galeForce)

         Spacer()

         Image(Constants.Images.check)
            .opacity(isSelected ? 1 : 0)

      }
      .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 20))
      .contentShape(Rectangle())
      .onTapGesture {
         action()
         self.dismiss()
      }
   }
}
