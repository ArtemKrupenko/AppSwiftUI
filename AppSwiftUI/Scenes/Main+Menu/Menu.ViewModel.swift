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
}
