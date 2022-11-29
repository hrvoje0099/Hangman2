//
// RadioRowView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

#warning("Ne koristim...")
struct RadioRowView: View {
   var name: String

   @State var isBindValue: Bool

   var body: some View {
      HStack {
         Text(LocalizedStringKey(name))
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(Constants.Fonts.patrickHand)
            .foregroundColor(Constants.Colors.textColor)
         Spacer()
         ZStack {
            Circle()
               .strokeBorder(Constants.Colors.sanJuan, lineWidth: 3.5)
               .frame(width: 30, height: 30)
            ZStack{
               Circle()
                  .frame(width: 15, height: 15)
                  .foregroundColor(isBindValue ? Constants.Colors.sanJuan : .clear)
            }
         }
      }
      .padding(EdgeInsets(top: 5, leading: 24, bottom: 5, trailing: 20))
      .contentShape(Rectangle())
      .onTapGesture {
         isBindValue.toggle()
      }
   }
}

struct RadioRowView_Previews: PreviewProvider {
    static var previews: some View {
       VStack {
          RadioRowView(name: "test", isBindValue: true)
          RadioRowView(name: "test", isBindValue: false)
       }
       .background(Constants.Colors.woodBlue)
    }
}
