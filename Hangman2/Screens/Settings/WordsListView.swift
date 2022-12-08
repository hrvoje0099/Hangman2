//
// WordsListView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct WordsListView: View {
   @Environment(\.dismiss) var dismiss

   #warning("Hard-coded")
   let wordsListExample = ["apple", "dog", "cat", "air", "debug"]

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.listOfAllWords) {
            dismiss()
         }

         SectionHeaderView(name: "\(GlobalSettings.wordsLanguage.localised)_WORDS", withInfo: true) {
            print("List of all words popup")
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
   }
}

struct WordsListView_Previews: PreviewProvider {
   static var previews: some View {
      WordsListView()
   }
}
