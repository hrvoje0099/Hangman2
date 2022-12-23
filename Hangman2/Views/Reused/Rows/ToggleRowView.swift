//
// ToggleRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct ToggleRowView: View {
   let name: LocalizedStringKey
   let onImageName: String
   let offImageName: String
   @State var isOn: Bool
   let action: (Bool) -> Void

   var body: some View {
      HStack {
         Text(name)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHand)
            .foregroundColor(Constants.Colors.galeForce)
         Spacer()
         ZStack {
            Capsule()
               .frame(width: 50, height: 30)
               .foregroundColor(Constants.Colors.blackBox)
            ZStack {
               Circle()
                  .frame(width: 25, height: 25)
                  .foregroundColor(Constants.Colors.galeForce)
               Image(systemName: isOn ?  onImageName : offImageName)
                  .foregroundColor(Constants.Colors.azulPetroleo)
            }
            .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
            .offset(x: isOn ? 10 : -10)
            .animation(.spring(), value: isOn)
         }
      }
      .frame(height: 55)
      .padding([.leading, .trailing], 20)
      .contentShape(Rectangle())
      .background(Constants.Colors.seaDeep)
      .onTapGesture {
         isOn.toggle()
         action(isOn)
      }
   }
}

// MARK: - Preview

struct ToggleRowView_Previews: PreviewProvider {
   static var previews: some View {
      ToggleRowView(
         name: "test",
         onImageName: Constants.Images.lightbulbFill,
         offImageName: Constants.Images.lightbulbSlashFill,
         isOn: false
      ) { _ in
      }
   }
}
