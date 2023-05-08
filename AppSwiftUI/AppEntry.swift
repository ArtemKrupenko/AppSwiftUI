//
//  AppEntry.swift
//  AppSwiftUI
//
//  Created by Артем on 14.03.2023.
//

import SwiftUI

@main
struct AppSwiftUIApp: App {
    
    @StateObject var menuViewModel: MenuViewModel = MenuViewModel()
    @AppStorage(StringValues.isDarkMode) private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(menuViewModel)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
