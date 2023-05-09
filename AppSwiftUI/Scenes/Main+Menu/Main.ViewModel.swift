//
//  MainViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 26.03.2023.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {
    
    @Environment(\.openURL) var openURL
    
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
    
    func ideaOpenURL() {
        if let url = URL(string: StringValues.ideaURL) {
            openURL(url)
        }
    }
    
    func errorOpenURL() {
        if let url = URL(string: StringValues.errorURL) {
            openURL(url)
        }
    }
}
