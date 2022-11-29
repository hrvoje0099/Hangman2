//
// CheckgRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct CheckgRowView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

   var title: String
   @State var isSelected: Bool
   var action: () -> Void

   var body: some View {
      HStack {
         Text(LocalizedStringKey(title))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHandM)
            .foregroundColor(Constants.Colors.textColor)
         Spacer()
         isSelected ? Image(Constants.Images.check) : Image("")
      }
      .padding(EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 20))
      .contentShape(Rectangle())
      .onTapGesture {
         action()
         self.presentationMode.wrappedValue.dismiss()
      }
   }
}
