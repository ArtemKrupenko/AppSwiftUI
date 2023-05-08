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
                            Text(StringValues.enterNewNameUser)
                                .textButtonPopup()
                            Spacer()
                        }
                        Divider()
                        TextField(StringValues.nameUser, text: $mainViewModel.newName)
                            .foregroundColor(.black) // почему не работает?
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
                                Text(StringValues.save)
                                    .textButtonPopup()
                            }
                            Spacer()
                            Button(action: {
                                mainViewModel.showPopupUserName = false
                            }) {
                                Text(StringValues.cancel)
                                    .textButtonPopup()
                            }
                        }
                    }.padding()
                }
                .framePopup()
            }
        }
    }
}
