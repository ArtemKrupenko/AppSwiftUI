//
//  HomeView.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    @StateObject var homePageViewModel = HomePageViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if mainViewModel.showPopupUserName == true {
                    PopupUserName()
                }
                else if mainViewModel.showPopupAccountDelete == true  {
                    PopupAccountDelete()
                } else {
                    Color(StringValues.goldButton)
                        .ignoresSafeArea()
                    MenuView(mainViewModel: mainViewModel)
                        .opacity(menuViewModel.isOpen ? 1 : 0)
                    ZStack {
                        if menuViewModel.selectedTab == StringValues.diary {
                            DiaryView(viewModel: DiaryViewModel(router: Router()))
                        } else if menuViewModel.selectedTab == StringValues.moodCalendar {
                            SmileView(viewModel: SmileViewModel())
                        } else if menuViewModel.selectedTab == StringValues.home {
                            HomePageView()
                        } else if menuViewModel.selectedTab == StringValues.motivation {
                            MotivationView(viewModel: MotivationViewModel())
                        } else if menuViewModel.selectedTab == StringValues.goodNews{
                            GoodNewsView()
                        }
                    }
                    .mask(RoundedRectangle(cornerRadius: menuViewModel.isOpen ? 25 : 0, style: .continuous))
                    .rotation3DEffect(.degrees(30), axis: (x: 0, y: menuViewModel.isOpen ? -1 : 0, z: 0))
                    .offset(x: menuViewModel.isOpen ? 250 : 0)
                    .ignoresSafeArea()
                }
            }
        }
        .environmentObject(mainViewModel)
        .environmentObject(menuViewModel)
        .accentColor(.primary)
        .onAppear {
            homePageViewModel.fetchCurrentUser()
        }
    }
}
