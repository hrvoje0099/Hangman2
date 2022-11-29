//
// ToggleRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ToggleRowView: View {
   var name: String
   var onImageName: String
   var offImageName: String
   @State var bindValue: Bool
   var action: () -> Void

   var body: some View {
      HStack {
         Text(LocalizedStringKey(name))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHandM)
            .foregroundColor(Constants.Colors.textColor)
         Spacer()
         ZStack {
            Capsule()
               .frame(width: 50, height: 30)
               .foregroundColor(Constants.Colors.blackBox)
            ZStack{
               Circle()
                  .frame(width: 25, height: 25)
                  .foregroundColor(Constants.Colors.textColor)
               Image(systemName: bindValue ?  onImageName : offImageName)
                  .foregroundColor(Constants.Colors.toggleBackground)
            }
            .shadow(color: .black.opacity(0.14), radius: 4, x: 0, y: 2)
            .offset(x: bindValue ? 10 : -10)
            .animation(.spring(), value: bindValue)
         }
      }
      .frame(height: 55)
      .padding([.leading, .trailing], 20)
      .contentShape(Rectangle())
      .background(Constants.Colors.seeDeepBlue)
      .onTapGesture {
         bindValue.toggle()
         action()
      }
   }
}

struct ToggleRowView_Previews: PreviewProvider {
   static var previews: some View {
      ToggleRowView(name: "test", onImageName: Constants.Images.lightbulbFill, offImageName: Constants.Images.lightbulbSlashFill, bindValue: false) {}
    }
}
