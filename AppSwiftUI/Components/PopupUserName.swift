//
//  PopupUserName.swift
//  AppSwiftUI
//
//  Created by Артем on 06.05.2023.
//

import SwiftUI

struct PopupUserName: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    var body: some View {
        ZStack {
            Color(StringValues.backgroundColor)
                .ignoresSafeArea()
            if $mainViewModel.showPopupUserName.wrappedValue {
                ZStack {
                    Color(StringValues.goldButton)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Text("Введите новое имя")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding()
                            Spacer()
                        }
                        Divider()
                        TextField("Имя", text: $mainViewModel.newName)
                            .padding(.horizontal)
                        Divider()
                        HStack {
                            Button(action: {
                                let user = User(name: mainViewModel.newName)
                                user.saveCurrentUser()
                                mainViewModel.user.name = user.name
                                menuViewModel.user.name = user.name
                                mainViewModel.newName = StringValues.nul
                                mainViewModel.showPopupUserName = false
                            }) {
                                Text("Сохранить")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .padding()
                            }
                            Spacer()
                            Button(action: {
                                mainViewModel.showPopupUserName = false
                            }) {
                                Text("Отмена")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                    .padding()
                            }
                        }
                    }.padding()
                }
                .frame(width: 300, height: 200)
                .cornerRadius(20)
                .shadow(radius: 20)
            }
        }
    }
}
