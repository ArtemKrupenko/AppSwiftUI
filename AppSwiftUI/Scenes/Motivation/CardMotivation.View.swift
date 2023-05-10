//
//  CardMotivation.View.swift
//  AppSwiftUI
//
//  Created by Артем on 10.05.2023.
//

import SwiftUI

struct CardMotivationView: View {
    
    @StateObject var viewModel: MotivationViewModel
    
    var quote: (text: String, author: String)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .gradientModifierGold().cornerRadius(20)
                .frame(width: 300, height: 400)
                .shadow(radius: 10)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20).stroke(.black).opacity(0.2)
                })
            VStack {
                Text(quote.text)
                    .foregroundColor(.black)
                    .font(.system(size: 19, weight: .bold))
                    .padding()
                    .frame(width: 270, height: 320, alignment: .center)
                    .multilineTextAlignment(.center)
                Text(quote.author)
                    .foregroundColor(.black)
                    .font(.footnote)
            }
        }
        .offset(x: viewModel.offset.width, y: viewModel.offset.height * 0.4)
        .rotationEffect(.degrees(Double(viewModel.offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    viewModel.offset = gesture.translation
                }
                .onEnded { gesture in
                    withAnimation {
                        viewModel.swipeCard(width: gesture.translation.width)
                    }
                }
        )
    }
}
