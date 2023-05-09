//
//  Empty.View.swift
//  AppSwiftUI
//
//  Created by Артем on 08.05.2023.
//

import SwiftUI

struct EmptyView: View {
    
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    var body: some View {
        backgroundViewApp()
        VStack {
            VStack {
                Spacer(minLength: 140)
                HStack {
                    Text(StringValues.empty)
                        .textTitle()
                    menuButton()
                }
                Text(StringValues.nul)
                    .textLabel()
                Spacer()
            }
            .frameTitleMenu()
            Spacer()
        }
        .accentColor(.primary)
        .environmentObject(menuViewModel)
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
