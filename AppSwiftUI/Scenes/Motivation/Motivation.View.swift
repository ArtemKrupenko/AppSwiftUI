//
//  Motivation.View.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI

struct MotivationView: View {
    
    @StateObject var viewModel: MotivationViewModel
    
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    var body: some View {
        ZStack {
            backgroundViewApp()
            VStack {
                Spacer().frame(height: 50)
                HStack {
                    Text(StringValues.nul)
                        .textTitle()
                    menuButton()
                }
                Spacer()
                ZStack {
                    ForEach(viewModel.quotes.indices, id: \.self) { index in
                        CardMotivationView(viewModel: viewModel, quote: viewModel.quotes[index])
                            .opacity(1 - Double(abs(index - viewModel.currentIndex)))
                    }
                }
                VStack {
                    HStack {
                        Image(systemName: StringValues.arrowLeft)
                        Text(StringValues.swipeLeftLabel)
                        Spacer()
                        Text(StringValues.swipeRightLabel)
                        Image(systemName: StringValues.arrowRight)
                    }
                    Spacer()
                    VStack {
                        Text(StringValues.randomQuoteLabel)
                    }
                }
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(width: 340, height: 80, alignment: .center)
                .multilineTextAlignment(.center)
                Button {
                    viewModel.randomMotivation()
                } label: {
                    Image(systemName: StringValues.shuffle)
                        .frame(width: 40)
                        .buttonColor()
                }
                Spacer()
            }
            .environmentObject(menuViewModel)
        }
    }
    
    @ViewBuilder
    private func menuButton() -> some View {
        if menuViewModel.sideButton {
            Button {
                withAnimation(.spring(response: 0.9, dampingFraction: 0.7)) {
                    menuViewModel.toggleMenu()
                }
            } label: {
                Image(systemName: StringValues.menuIcon)
                    .font(.title)
                    .foregroundColor(Color(StringValues.buttonColor))
            }
            .frame(width: 20, alignment: .trailing)
        }
    }
}
