//
//  Menu.View.swift
//  AppSwiftUI
//
//  Created by Артем on 05.05.2023.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var menuViewModel: MenuViewModel
    @StateObject var mainViewModel: MainViewModel
    
    @Namespace var animation
    
    var body: some View {
        ZStack {
            VStack {
                topScreen()
                    .padding()
                menuButton(icon: StringValues.person, text: StringValues.changeNameUser, action: mainViewModel.renamePopup)
                tabItemMenu()
                menuButton(icon: StringValues.lightbulb, text: StringValues.idea, action: mainViewModel.ideaOpenURL)
                menuButton(icon: StringValues.exclamationmarkTriangle, text: StringValues.error, action: mainViewModel.errorOpenURL)
                menuButton(icon: StringValues.trash, text: StringValues.deleteAccount, action: mainViewModel.accountDeletePopup)
                separator()
                DarkToggle()
            }
            .frame(maxWidth: 288, maxHeight: .infinity)
            .background(Color(StringValues.buttonColor))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func topScreen() -> some View {
        HStack {
            Text(StringValues.menu)
                .foregroundColor(.black)
                .font(.title3)
                .bold()
            Spacer()
            Button {
                withAnimation(.easeIn) {
                    menuViewModel.toggleMenu()
                }
            } label: {
                Image(systemName: StringValues.xmark)
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
    }
    
    @ViewBuilder
    private func menuButton(icon: String, text: String, action: @escaping () -> Void) -> some View {
        separator()
        Button(action: {
            withAnimation {
                action()
            }
        }, label: {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.headline)
                    .frame(width: 30)
                Text(text)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
        })
    }
    
    @ViewBuilder
    private func tabItemMenu() -> some View {
        VStack {
            separator()
            VStack(alignment: .leading) {
                ForEach(arrayIconsTabBar) { item in
                    TabButton(icon: item.icon, title: item.title, selectedTab: $menuViewModel.selectedTab, animation: animation)
                }
                separator()
                ForEach(arrayIconsAbout) { item in
                    TabButton(icon: item.icon, title: item.title, selectedTab: $menuViewModel.selectedTab, animation: animation)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    
    @ViewBuilder
    private func separator() -> some View {
        Rectangle()
            .frame(height: 1)
            .opacity(0.2)
            .foregroundColor(.black)
            .padding(.horizontal)
    }
}

struct TabButton: View {
    
    var icon: String
    var title: String
    @Binding var selectedTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                selectedTab = title
            }
        } label: {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.headline)
                    .frame(width: 30)
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color(StringValues.buttonColor) : .black)
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .background(
                Color(StringValues.backgroundColor)
                    .opacity(selectedTab == title ? 1 : 0)
                    .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 20))
            )
        }
    }
}

struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DarkToggle: View {
    
    @AppStorage(StringValues.isDarkMode) var isDarkMode = false
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    var body: some View {
        HStack {
            Image(systemName: StringValues.moon)
                .font(.headline)
                .frame(width: 30)
            Text(StringValues.darkMode)
                .fontWeight(.semibold)
            Spacer()
            Toggle(isOn: $isDarkMode) {
            }
            .tint(Color(StringValues.backgroundColor))
            .frame(width: 80, height: 30)
        }
        .padding()
        .foregroundColor(.black)
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}
