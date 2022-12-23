//
// CheckRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct CheckRowView: View {
   @Environment(\.dismiss) var dismiss

   let title: LocalizedStringKey
   let isSelected: Bool
   let action: () -> Void

   init(title: LocalizedStringKey, _ isSelected: Bool, action: @escaping () -> Void) {
      self.title = title
      self.isSelected = isSelected
      self.action = action
   }

   var body: some View {
      HStack {
         Text(title)
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

// MARK: - Preview

struct CheckRowView_Previews: PreviewProvider {
   static var previews: some View {
      VStack {
         CheckRowView(title: "test1", true) {}
         CheckRowView(title: "test2", false) {}
      }
   }
}
