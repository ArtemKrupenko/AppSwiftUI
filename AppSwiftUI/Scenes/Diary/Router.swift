//
//  Router.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import SwiftUI

class Router: ObservableObject {
    
    @Published var path = NavigationPath()

    func reset() {
        path = NavigationPath()
    }
}
