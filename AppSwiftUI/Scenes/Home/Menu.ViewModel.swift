//
//  Menu.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 05.05.2023.
//

import Foundation

final class MenuViewModel: ObservableObject {
    
    @Published var isOpen: Bool = false
    @Published var sideButton: Bool = true
    @Published var selectedTab = "Главная"
    var user: User = User.currentUser
    
    func toggleMenu() {
        isOpen.toggle()
        sideButton.toggle()
    }
}

struct IconsTabBar: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
}

var arrayIconsTabBar = [
    IconsTabBar(icon: "text.book.closed", title: StringValues.diary),
    IconsTabBar(icon: "face.smiling", title: StringValues.moodCalendar),
    IconsTabBar(icon: "house.fill", title: StringValues.home),
    IconsTabBar(icon: "quote.bubble", title: StringValues.motivation),
    IconsTabBar(icon: "scroll", title: StringValues.goodNews)
]

var arrayIconsAbout = [
    IconsTabBar(icon: "doc", title: "О приложении"),
    IconsTabBar(icon: "lightbulb", title: "Предложить идею"),
    IconsTabBar(icon: "ladybug", title: "Сообщить об ошибке"),
    IconsTabBar(icon: "ellipsis.bubble", title: "Оставить отзыв"),
    IconsTabBar(icon: "paperplane.circle", title: "Подписаться в Telegram"),
    IconsTabBar(icon: "signature", title: "Лицензии")
]
