//
// WordsListView
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct WordsListView: View {
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

   #warning("Hard coded")
   let wordsListExample = ["apple", "dog", "cat", "air", "debug"]

   var columns = [
      GridItem(.flexible()),
      GridItem(.flexible())
   ]
   
   var body: some View {
      VStack {
         CustomNavigationView(title: Constants.LocalisedString.listOfAllWords) {
            self.presentationMode.wrappedValue.dismiss()
         }

         ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
               ForEach(wordsListExample, id: \.self) { word in
                  HStack {
                     Text(word)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(Constants.Fonts.patrickHandM)
                        .foregroundColor(Constants.Colors.textColor)

                  }
                  .frame(height: 55)
                  .padding([.leading, .trailing], 20)
                  .background(Constants.Colors.seeDeepBlue)
               }
            }
         }

         Spacer()
      }
      .background(Constants.Colors.woodBlue)
      .scrollContentBackground(.hidden)
      .navigationBarBackButtonHidden()
   }
}

struct WordsListView_Previews: PreviewProvider {
   static var previews: some View {
      WordsListView()
   }
}
