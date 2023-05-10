//
//  Motivation.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import Foundation

final class MotivationViewModel: ObservableObject {
    
    @Published var quotes: [(text: String, author: String)] = Motivation().text.enumerated().map({ index, value in (text: value, author: Motivation().author.reversed()[index]) })

    @Published var currentIndex = 0
    
    @Published var offset = CGSize.zero

    func nextQuote() {
        currentIndex = (currentIndex + 1) % quotes.count
    }

    func previousQuote() {
        currentIndex = currentIndex == 0 ? quotes.count - 1 : currentIndex - 1
    }
    
    func swipeCard(width: CGFloat) {
        if width > 150 {
            previousQuote()
        } else if width < -150 {
            nextQuote()
        }
        offset = .zero
    }
    
    func randomMotivation() {
        quotes.shuffle()
    }
}
