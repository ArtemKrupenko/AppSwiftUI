//
//  MainViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 26.03.2023.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var selectedView: TabViewEnum = .home
    
    @Published var user: User
    @Published var newName = StringValues.nul
    
    @Published var showPopupUserName = false
    @Published var showPopupAccountDelete = false
    
    init(user: User) {
        self.user = user
    }
    
    func setSelectedView(_ view: TabViewEnum) {
        selectedView = view
    }
    
    func saveUser() {
        user.saveCurrentUser()
    }
    
    func renamePopup() {
        showPopupUserName = true
        newName = user.name
    }

    func accountDeletePopup() {
        showPopupAccountDelete = true
    }
}
