//
// ToggleRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ToggleRowView: View {
   let name: LocalizedStringKey
   let onImageName: String
   let offImageName: String
   @State var bindValue: Bool
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
               Image(systemName: bindValue ?  onImageName : offImageName)
                  .foregroundColor(Constants.Colors.azulPetroleo)
            }
            .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
            .offset(x: bindValue ? 10 : -10)
            .animation(.spring(), value: bindValue)
         }
      }
      .frame(height: 55)
      .padding([.leading, .trailing], 20)
      .contentShape(Rectangle())
      .background(Constants.Colors.seaDeep)
      .onTapGesture {
         bindValue.toggle()
         action(bindValue)
      }
   }
}

struct ToggleRowView_Previews: PreviewProvider {
   static var previews: some View {
      ToggleRowView(
         name: "test",
         onImageName: Constants.Images.lightbulbFill,
         offImageName: Constants.Images.lightbulbSlashFill,
         bindValue: false
      ) { _ in
      }
   }
}
