//
//  StartView.swift
//  AppSwiftUI
//
//  Created by Артем on 21.03.2023.
//

import SwiftUI

struct StartView: View {
    
    @State var user: User
    
    @State var isPressStart = false
    @FocusState var nameIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                gradientModifierGold()
//                Image("welcome-seal").resizable().edgesIgnoringSafeArea(.all).opacity(1)
                VStack(spacing: 15) {
                    Text("Давай знакомиться!")
                        .foregroundColor(.black)
                        .font(.title2)
                        .bold()
                    Text("Как тебя зовут?")
                        .foregroundColor(.black)
                        .font(.title2)
                        .frame(width: 350, height: 40, alignment: .center)
                        .multilineTextAlignment(.center)
//                    Text("Я тюлень. И зовут меня Леня \nА еще меня часто называют как Лени, Ленько или Леньюшка \nКак зовут тебя?")
//                        .foregroundColor(.black)
//                        .font(.title2)
//                        .frame(width: 350, height: 120, alignment: .center)
//                        .multilineTextAlignment(.center)
                    TextField("Ваше имя", text: $user.name)
                        .focused($nameIsFocused)
                        .whiteTextField()
                    Button {
                        isPressStart = true
                        nameIsFocused = false
                        // Сохраняем имя пользователя в UserDefaults
                        user.saveCurrentUser()
                    } label: {
                        Text("Продолжить")
                            .frame(width: 350)
                            .buttonGold()
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 20).stroke(.black).opacity(0.2)
                            })
                    }
                }.fullScreenCover(isPresented: $isPressStart) {
                    // Если имя пользователя уже было введено, открываем сразу HomeView
                    if user.name != StringValues.nul {
                        let mainViewModel = MainViewModel(user: user)
                        MainView(mainViewModel: mainViewModel)
                    } else {
                        StartView(user: user)
                    }
                }.frame(width: 350)
            }
        }
        .onAppear {
            // Загружаем имя пользователя из UserDefaults
            user = User.currentUser
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(user: User(name: StringValues.nul))
    }
}
