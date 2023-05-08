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
                            Text(StringValues.deleteAccountTitle)
                                .textButtonPopup()
                            Spacer()
                        }
                        Text(StringValues.deleteAccountLabel)
                            .frame(width: 280, height: 50)
                            .foregroundColor(.black)
                        HStack {
                            Button(action: {
                                mainViewModel.user.resetDefaults()
                                mainViewModel.showPopupAccountDelete = false
                            }) {
                                Text(StringValues.delete)
                                    .foregroundColor(.red)
                                    .textButtonPopup()
                            }
                            Spacer()
                            Button(action: {
                                mainViewModel.showPopupAccountDelete = false
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
