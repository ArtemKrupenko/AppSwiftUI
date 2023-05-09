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
    
    /// Заглавие
    func textTitle() -> some View {
        modifier(TextTitleModifier())
    }
    
    /// Лейбл под заглавием
    func textLabel() -> some View {
        modifier(TextLabelModifier())
    }
    
    /// Размер заглавия с кнопкой меню
    func frameTitleMenu() -> some View {
        modifier(FrameTitleMenuModifier())
    }
    
    /// Текст кнопки в поп-апе
    func textButtonPopup() -> some View {
        modifier(TextButtonPopupModifier())
    }
    
    ///  Поп-ап
    func framePopup() -> some View {
        modifier(FramePopupModifier())
    }
    
    /// Белый TextField
    func whiteTextField() -> some View {
        modifier(WhiteTextFieldModifier())
    }
    
    /// Стиль плейсхолдера TextField
    func placeholderStyle(showPlaceHolder: Bool, placeholder: String) -> some View {
        modifier(PlaceholderStyleModifier(showPlaceHolder: showPlaceHolder, placeholder: placeholder))
    }
    
    /// Длинная золотая кнопка
    func buttonGold() -> some View {
        modifier(ButtonGoldModifier())
    }
    
    /// Круг на таббаре
//    func imageIconHome() -> some View {
//        modifier(ImageIconHomeModifier())
//    }
    
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

/// Заглавие
struct TextTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .medium))
            .frame(width: 320, height: 20, alignment: .leading)
            .padding(.leading, 10)
    }
}

/// Лейбл под заглавием
struct TextLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineSpacing(5)
            .frame(width: 340, height: 130, alignment: .leading)
    }
}

/// Размер заглавия с кнопкой меню
struct FrameTitleMenuModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 360, height: 140, alignment: .leading)
            .foregroundColor(.primary)
    }
}

/// Текст кнопки в поп-апе
struct TextButtonPopupModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.headline)
            .padding()
    }
}

///  Поп-ап
struct FramePopupModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            .shadow(radius: 20)
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

/// Стиль плейсхолдера TextField
struct PlaceholderStyleModifier: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                .padding(.horizontal, 5)
            }
            content
            .foregroundColor(Color.black)
            .padding(5)
        }
    }
}

/// Длинная золотая кнопка
struct ButtonGoldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .frame(height: 40)
            .background(Color(StringValues.buttonColor))
            .font(.system(size: 22, weight: .thin))
            .cornerRadius(20)
    }
}

/// Круг на таббаре
//struct ImageIconHomeModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.system(size: 25, weight: .semibold, design: .default))
//            .frame(width: 60, height: 60)
//            .background(Color(StringValues.backgroundColor))
//            .opacity(1)
//            .cornerRadius(30)
//            .overlay(content: {
//                RoundedRectangle(cornerRadius: 30).stroke(.black).opacity(0.1)
//            })
//    }
//}

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
        LinearGradient(colors: [
            Color(StringValues.forGradientOne).opacity(1),
            Color(StringValues.forGradientTwo).opacity(1)
        ], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
    }
}
