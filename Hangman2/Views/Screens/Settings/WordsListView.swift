//
// WordsListView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct WordsListView: View {

   // Propertiess

   @Environment(\.dismiss) var dismiss

   @State private var presentPopup = false

   let wordsListExample = ["apple", "dog", "cat", "air", "debug"]

   // Body

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.listOfAllWords) {
            dismiss()
         }

         SectionHeaderView(text: getSectionHeaderTitle(), withInfo: true) {
            presentPopup.toggle()
         }

         ScrollView {
            LazyVGrid(
               columns: [
                  GridItem(.flexible()),
                  GridItem(.flexible())
               ],
               spacing: 10
            ) {
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
      .groupedViewSetupWhereIsPopup(backgroundColor: Constants.Colors.bluewood, isPresented: presentPopup)
      .popup(isPresented: presentPopup, alignment: .center, direction: .top) {
         InfoPopupView(text: Constants.LocalisedString.listOfAllWordsInfo) {
            presentPopup.toggle()
         }
      }
   }

   // Helper Methods

   private func getSectionHeaderTitle() -> LocalizedStringKey {
      let wordsLanguage = AppSettings.shared.wordsLanguage
      switch wordsLanguage {
      case .english:
         return Constants.LocalisedString.englishWords
      case .croatian:
         return Constants.LocalisedString.croatianWords
      }
   }
}

// MARK: - Preview

struct WordsListView_Previews: PreviewProvider {
   static var previews: some View {
      WordsListView()
   }
}
