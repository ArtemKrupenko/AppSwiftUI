//
//  User.swift
//  AppSwiftUI
//
//  Created by Артем on 26.03.2023.
//

import Foundation

struct User: Codable {
    var name: String
}

extension User {
    
    static var currentUser: User {
        let defaults = UserDefaults.standard
        if let savedUser = defaults.object(forKey: StringValues.currentUser) as? Data,
           let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
            return decodedUser
        }
        return User(name: StringValues.nul)
    }
    
    static func retrieveCurrentUser() -> User? {
        let defaults = UserDefaults.standard
        if let name = defaults.string(forKey: StringValues.currentUser) {
            return User(name: name)
        }
        return nil
    }

    func saveCurrentUser() {
        let data = try? JSONEncoder().encode(self)
        UserDefaults.standard.set(data, forKey: StringValues.currentUser)
    }

    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}
