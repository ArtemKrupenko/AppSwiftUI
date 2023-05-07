//
//  ViewModifiers.swift
//  AppSwiftUI
//
//  Created by Артем on 21.03.2023.
//

import SwiftUI

extension View {
    
    /// Фон приложения
    func backgroundViewApp() -> some View {
        modifier(BackgroundViewApp())
    }
    
    /// Белый TextField
    func whiteTextField() -> some View {
        modifier(WhiteTextFieldModifier())
    }
    
    /// Длинная золотая кнопка
    func buttonGold() -> some View {
        modifier(ButtonGoldModifier())
    }
    
    /// Круг на таббаре
    func imageIconHome() -> some View {
        modifier(ImageIconHomeModifier())
    }
    
    /// Изображение смайлика
    func imageIconSmile() -> some View {
        modifier(ImageIconSmileModifier())
    }
    
    /// Золотой градиент
    func gradientModifierGold() -> some View {
        modifier(LinearGradientGoldModifier())
    }
}

/// Фон приложения
struct BackgroundViewApp: ViewModifier {
    func body(content: Content) -> some View {
        Color(StringValues.backgroundColor).edgesIgnoringSafeArea(.all)
    }
}

/// Белый TextField
struct WhiteTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 350, height: 40)
            .foregroundColor(.black)
            .background(.white)
            .cornerRadius(20)
            .font(.system(size: 22, weight: .thin))
            .overlay(content: {
                RoundedRectangle(cornerRadius: 20).stroke(.black)
            })
    }
}

/// Длинная золотая кнопка
struct ButtonGoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .frame(height: 40)
            .background(Color(StringValues.goldButton))
            .font(.system(size: 22, weight: .thin))
            .cornerRadius(20)
    }
}

/// Круг на таббаре
struct ImageIconHomeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25, weight: .semibold, design: .default))
            .frame(width: 60, height: 60)
            .background(Color(StringValues.backgroundColor))
            .opacity(1)
            .cornerRadius(30)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 30).stroke(.black).opacity(0.1)
            })
    }
}

/// Изображение смайлика
struct ImageIconSmileModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 50))
            .frame(width: 50, height: 50)
            .background(.clear)
            .cornerRadius(25)
    }
}

/// Золотой градиент
struct LinearGradientGoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        LinearGradient(colors: [Color("#F6E296").opacity(1), Color("#C38C36").opacity(1)], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
    }
}
