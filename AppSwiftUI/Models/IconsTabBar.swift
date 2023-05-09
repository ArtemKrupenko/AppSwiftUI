//
//  IconsTabBar.swift
//  AppSwiftUI
//
//  Created by Артем on 08.05.2023.
//

import Foundation

struct IconsTabBar: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
}

var arrayIconsTabBar = [
    IconsTabBar(icon: StringValues.house, title: StringValues.home),
    IconsTabBar(icon: StringValues.quoteBubble, title: StringValues.motivation),
    IconsTabBar(icon: StringValues.textBookClosed, title: StringValues.diary),
    IconsTabBar(icon: StringValues.scroll, title: StringValues.goodNews),
    IconsTabBar(icon: StringValues.calendar, title: StringValues.moodCalendar)
]

var arrayIconsAbout = [
    IconsTabBar(icon: StringValues.doc, title: StringValues.aboutApp),
    IconsTabBar(icon: StringValues.ellipsisBubble, title: StringValues.feedback),
    IconsTabBar(icon: StringValues.paperplaneCircle, title: StringValues.telegram)
]

enum TabViewEnum {
    case home
    case motivation
    case diary
    case goodNews
    case moodCalendar
    case aboutApp
    case feedback
    case telegram
}
