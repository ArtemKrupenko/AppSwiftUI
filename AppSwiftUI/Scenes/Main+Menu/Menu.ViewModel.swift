//
//  Menu.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 05.05.2023.
//

import Foundation

final class MenuViewModel: ObservableObject {
    
    @Published var isMenuOpen = false
    @Published var selectedTab = StringValues.home
    
    @Published var isOpen: Bool = false
    @Published var sideButton: Bool = true
    
    var user: User = User.currentUser
    
    func toggleMenu() {
        isOpen.toggle()
        sideButton.toggle()
    }
    
    // Обновление выбранного представления в MainViewModel при переключении вкладки
    func selectTab(_ tab: String, mainViewModel: MainViewModel) {
        selectedTab = tab
        
        switch selectedTab {
        case StringValues.home:
            mainViewModel.setSelectedView(.home)
        case StringValues.diary:
            mainViewModel.setSelectedView(.diary)
        case StringValues.moodCalendar:
            mainViewModel.setSelectedView(.moodCalendar)
        case StringValues.motivation:
            mainViewModel.setSelectedView(.motivation)
        default:
            break
        }
    }
}
