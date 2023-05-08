//
//  HomePage.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 08.05.2023.
//

import Foundation

final class HomePageViewModel: ObservableObject {
    @Published var currentUser: User = User(name: StringValues.nul)

    func fetchCurrentUser() {
        if let data = UserDefaults.standard.data(forKey: StringValues.currentUser),
           let currentUser = try? JSONDecoder().decode(User.self, from: data) {
            self.currentUser = currentUser
        } else {
            currentUser.saveCurrentUser()
        }
    }
}
