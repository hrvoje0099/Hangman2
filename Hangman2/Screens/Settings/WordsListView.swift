//
// WordsListView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct WordsListView: View {
   @Environment(\.dismiss) var dismiss

   @State private var presentPopup = false

   #warning("Hard-coded")
   let wordsListExample = ["apple", "dog", "cat", "air", "debug"]

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.listOfAllWords) {
            dismiss()
         }

         SectionHeaderView(name: "\(GlobalSettings.wordsLanguage.localised)_WORDS", withInfo: true) {
            presentPopup.toggle()
         }

         ScrollView {
            LazyVGrid(
               columns: [
                  GridItem(.flexible()),
                  GridItem(.flexible())
               ], spacing: 10) {
                  ForEach(wordsListExample, id: \.self) { word in
                     HStack {
                        Text(word)
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .font(Constants.Fonts.patrickHand)
                           .foregroundColor(Constants.Colors.galeForce)
                     }
                     .frame(height: 55)
                     .padding([.leading, .trailing], 20)
                     .background(Constants.Colors.seaDeep)
                  }
               }
         }

         Spacer()
      }
      .background(Constants.Colors.bluewood)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
      .blur(radius: presentPopup ? 3 : 0)
      .disabled(presentPopup)
      .popup(isPresented: presentPopup, alignment: .center, direction: .top) {
         AllWordsPopupView {
            presentPopup.toggle()
         }
      }
   }
}

struct WordsListView_Previews: PreviewProvider {
   static var previews: some View {
      WordsListView()
   }
}
