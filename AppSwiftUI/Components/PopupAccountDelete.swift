//
//  PopupAccountDelete.swift
//  AppSwiftUI
//
//  Created by Артем on 07.05.2023.
//

import SwiftUI

struct PopupAccountDelete: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    var body: some View {
        ZStack {
            Color(StringValues.backgroundColor)
                .ignoresSafeArea()
            if $mainViewModel.showPopupAccountDelete.wrappedValue {
                ZStack {
                    Color(StringValues.goldButton)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Text("Вы уверены?")
                                .foregroundColor(.black)
                                .font(.headline)
                                .padding()
                            Spacer()
                        }
                        Text("Удаление аккаунта приведет к потере всех ваших данных 🥺")
                            .frame(width: 280, height: 50)
                            .foregroundColor(.black)
                        HStack {
                            Button(action: {
                                mainViewModel.user.resetDefaults()
                                mainViewModel.showPopupAccountDelete = false
                            }) {
                                Text("Удалить")
                                    .foregroundColor(.red)
                                    .font(.headline)
                                    .padding()
                            }
                            Spacer()
                            Button(action: {
                                mainViewModel.showPopupAccountDelete = false
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
