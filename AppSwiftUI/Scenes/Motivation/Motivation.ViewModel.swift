//
//  Motivation.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import Foundation

final class MotivationViewModel: ObservableObject {
    
    @Published var quote = Motivation()
    
    func randomMotivation() {
        let randomInt = Int.random(in: 0..<quote.text.count)
        let text = quote.text[randomInt]
        let author = quote.author[randomInt]
        quote.randomQuote = [text, author]
    }
}
