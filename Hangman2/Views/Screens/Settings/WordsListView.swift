//
// WordsListView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

// MARK: - Main View

struct WordsListView: View {
   @Environment(\.dismiss) var dismiss

   @State private var presentWordsInfoPopup = false
   @EnvironmentObject private var wordModel: WordModel

   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.listOfAllWords) {
            dismiss()
         }

         SectionHeaderView(text: getSectionHeaderTitle(), withInfo: true) {
            presentWordsInfoPopup.toggle()
         }

         ScrollView {
            LazyVGrid(
               columns: [
                  GridItem(.flexible()),
                  GridItem(.flexible())
               ],
               spacing: 10
            ) {
               ForEach(wordModel.allWords) { wordObject in
                  HStack {
                     Text(wordObject.word)
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
      .setupCommonModifiers(backgroundColor: Constants.Colors.bluewood, isPresented: presentWordsInfoPopup)
      .popup(isPresented: presentWordsInfoPopup, alignment: .center, direction: .top) {
         InfoPopupView(text: Constants.LocalisedString.listOfAllWordsInfo) {
            presentWordsInfoPopup.toggle()
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
      Group {
         WordsListView().environmentObject({ () -> WordModel in
            let wordModel = WordModel(wordService: WordService())
            wordModel.getAllWords()
            return wordModel
         }())
      }
   }
}
