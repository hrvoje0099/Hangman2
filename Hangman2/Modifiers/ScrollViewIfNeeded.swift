//
// ScrollViewIfNeeded
// Hangman2
//
// Created by Hrvoje
//

import SwiftUI

struct ScrollViewIfNeeded<Content: View>: View {
   @ViewBuilder let content: () -> Content

   @State private var scrollViewSize: CGSize = .zero
   @State private var contentSize: CGSize = .zero

   var body: some View {
      ScrollView(shouldScroll ? [.vertical] : []) {
         content().readSize($contentSize)
      }
      .readSize($scrollViewSize)
   }

   private var shouldScroll: Bool {
      scrollViewSize.height <= contentSize.height
   }
}

struct SizeReaderModifier: ViewModifier {
   @Binding var size: CGSize

   func body(content: Content) -> some View {
      content.background(
         GeometryReader { geometry -> Color in
            DispatchQueue.main.async {
               size = geometry.size
            }
            return Color.clear
         }
      )
   }
}

extension View {
   func readSize(_ size: Binding<CGSize>) -> some View {
      self.modifier(SizeReaderModifier(size: size))
   }
}
