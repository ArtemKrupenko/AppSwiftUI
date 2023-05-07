//
//  AppEntry.swift
//  AppSwiftUI
//
//  Created by Артем on 14.03.2023.
//

import SwiftUI

@main
struct AppSwiftUIApp: App {
    
    @StateObject var viewModel: MenuViewModel = MenuViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(viewModel)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
