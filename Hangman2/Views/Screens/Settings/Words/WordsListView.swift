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
   @EnvironmentObject private var appModel: AppModel

   @State private var searchText = ""
   @State private var presentFilterByDifficulty = false
   @State var searchResults = [Word]()

   var body: some View {
      VStack(spacing: 0) {
         navigationAndHeader
         searchBar
         if presentFilterByDifficulty { filterView }
         wordsList
      }
      .setupCommonModifiers(backgroundColor: Constants.Colors.bluewood, isPresented: presentWordsInfoPopup)
      .onAppear {
         searchResults = appModel.allWords
      }
      .popup(isPresented: presentWordsInfoPopup, alignment: .center, direction: .top) {
         WordsPopupView {
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

   private func search() {
      if searchText.isEmpty {
         searchResults = appModel.allWords
      } else {
         searchResults = appModel.allWords.filter { $0.word.contains(searchText) }
      }
   }

   private func filterBy(difficulty: Difficulty) {
      if searchText.isEmpty {
         searchResults = appModel.allWords.filter { $0.difficulty == difficulty }
      } else {
         searchResults = appModel.allWords.filter { $0.word.contains(searchText) }
         searchResults = searchResults.filter { $0.difficulty == difficulty }
      }
   }
}

// MARK: - View Parts

extension WordsListView {
   private var navigationAndHeader: some View {
      Group {
         CustomNavigationView(title: Constants.LocalisedString.listOfAllWords) {
            dismiss()
         }

         SectionHeaderView(text: getSectionHeaderTitle(), withInfo: true) {
            presentWordsInfoPopup.toggle()
         }
      }
   }

   private var searchBar: some View {
      ZStack {
         Rectangle()
            .foregroundColor(Constants.Colors.azulPetroleo)
         HStack(spacing: 5) {
            Image(systemName: Constants.Images.magnifyingGlass)
            TextField(Constants.LocalisedString.searchWithDots, text: $searchText)
               .textInputAutocapitalization(.never)
               .onChange(of: searchText) { _ in
                  if presentFilterByDifficulty {
                     searchResults = appModel.allWords
                     withAnimation {
                        presentFilterByDifficulty = false
                     }
                  }
                  search()
               }
            if !searchText.isEmpty {
               Image(systemName: Constants.Images.cleanText)
                  .onTapGesture {
                     searchText = ""
                  }
            }
            Image(systemName: presentFilterByDifficulty ? Constants.Images.filterFill : Constants.Images.filterEmpty)
               .onTapGesture {
                  withAnimation {
                     presentFilterByDifficulty.toggle()
                  }
               }
         }
         .foregroundColor(.gray)
         .padding([.leading, .trailing], 7)
      }
      .frame(height: 35)
      .font(Constants.Fonts.patrickHandXS)
      .cornerRadius(10)
      .padding(10)
   }

   private var filterView: some View {
      HStack(alignment: .center) {
         Group {
            Button(Constants.LocalisedString.easy) {
               filterBy(difficulty: .easy)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.green)

            Button(Constants.LocalisedString.medium) {
               filterBy(difficulty: .medium)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.yellow)

            Button(Constants.LocalisedString.hard) {
               filterBy(difficulty: .hard)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(.red)
         }
         .background(Constants.Colors.azulPetroleo)
         .cornerRadius(10)
         .foregroundColor(Constants.Colors.riverBed)
         .font(Constants.Fonts.patrickHandS)
      }
      .padding([.leading, .trailing], 10)
      .transition(.asymmetric(insertion: .scale, removal: .opacity))
   }

   private var wordsList: some View {
      Group {
         ScrollView {
            LazyVGrid(
               columns: [
                  GridItem(.flexible()),
                  GridItem(.flexible())
               ],
               spacing: 10
            ) {
               ForEach(searchResults, id: \.self) { wordObject in
                  WordCardView(
                     word: wordObject.word,
                     hint: wordObject.hint,
                     type: wordObject.difficulty
                  )
               }
            }
            .padding([.leading, .trailing], 10)
         }
         .padding(.top, 10)

         Spacer()
      }
   }
}
