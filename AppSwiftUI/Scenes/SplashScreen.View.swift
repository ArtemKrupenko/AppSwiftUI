//
//  SplashScreenView.swift
//  AppSwiftUI
//
//  Created by Артем on 05.05.2023.
//

import SwiftUI

struct SplashScreenView: View {
    
    @StateObject var router = Router()
    
    // Создаем переменную для хранения имени пользователя
    let currentUser = User.currentUser
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            // Если имя пользователя уже было введено, открываем сразу HomeView
            if currentUser.name != StringValues.nul {
                let mainViewModel = MainViewModel(user: currentUser)
                MainView(mainViewModel: mainViewModel)
                    .environmentObject(router)
            } else {
                StartView(user: currentUser)
            }
        } else {
            ZStack {
                gradientModifierGold()
                VStack {
                    Image(systemName: "aqi.medium")
                        .font(.system(size: 100))
                        .foregroundColor(.black.opacity(0.8))
//                    Text("Название")
//                        .font(Font.custom("Baskerville-Bold", size: 26))
//                        .foregroundColor(.black.opacity(0.8))
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 1.2
                        self.opacity = 1
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
