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
                    Color(StringValues.buttonColor)
                        .ignoresSafeArea()
                    MenuView(mainViewModel: mainViewModel)
                        .opacity(menuViewModel.isOpen ? 1 : 0)
                    ZStack {
                        switch menuViewModel.selectedTab {
                            case StringValues.diary:
                                DiaryView(viewModel: DiaryViewModel(router: Router()))
                            case StringValues.moodCalendar:
                                SmileView(viewModel: SmileViewModel())
                            case StringValues.home:
                                HomePageView()
                            case StringValues.motivation:
                                MotivationView(viewModel: MotivationViewModel())
                            case StringValues.goodNews:
                                GoodNewsView()
                            case StringValues.aboutApp:
                                EmptyView()
                            case StringValues.feedback:
                                EmptyView()
                            case StringValues.telegram:
                                EmptyView()
                            default:
                                EmptyView()
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
