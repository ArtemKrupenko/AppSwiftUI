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
    
//    @Binding var selectedTab: String
    
//    init(selectedTab: Binding<String>) {
//        self._selectedTab = selectedTab
//        UITabBar.appearance().isHidden = true
//    }
    
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
                        HomePageView()
//                        TabView(selection: $mainViewModel.selectedTab) {
//                            HomePageView()
//                                .tag(StringValues.home)
//                            DiaryView()
//                                .tag(StringValues.diary)
//                            SmileView(viewModel: SmileViewModel())
//                                .tag(StringValues.moodCalendar)
//                            MotivationView(viewModel: MotivationViewModel())
//                                .tag(StringValues.motivation)
//                            GoodNewsView()
//                                .tag(StringValues.goodNews)
//                        }
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

struct HomePageView: View {
    
    @EnvironmentObject var menuViewModel: MenuViewModel
    @EnvironmentObject var homePageViewModel: HomePageViewModel
    
    var body: some View {
        backgroundViewApp()
        VStack {
            VStack {
                Spacer(minLength: 140)
                HStack {
                    Text("Привет \(menuViewModel.user.name)!")
                        .font(.system(size: 20, weight: .medium))
                        .frame(width: 290, height: 20, alignment: .leading)
                        .padding(.leading, 20)
                    menuButton()
                }
                Spacer()
                Text("Здесь ты найдешь инструменты, \nкоторые помогут в заботе о себе \nВсе будет хорошо! 🙏🏻")
                    .lineSpacing(5)
                    .frame(width: 340, height: 80, alignment: .leading)
                    .padding(.leading, 20)
            }
            .frame(width: 360, height: 100, alignment: .leading)
//            .onAppear {
//                homePageViewModel.fetchCurrentUser()
//            }
            .foregroundColor(.primary)
            Spacer()
        }
        .environmentObject(menuViewModel)
//        .environmentObject(homePageViewModel)
    }
    
    @ViewBuilder
    private func menuButton() -> some View {
        if menuViewModel.sideButton {
            Button {
                withAnimation(.spring(response: 0.9, dampingFraction: 0.7)) {
                    menuViewModel.toggleMenu()
                }
            } label: {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .font(.title)
                    .foregroundColor(Color(StringValues.goldButton))
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
}

//
final class HomePageViewModel: ObservableObject {
    @Published var currentUser: User = User(name: StringValues.nul)
    
    func fetchCurrentUser() {
        if let data = UserDefaults.standard.data(forKey: StringValues.currentUser),
           let currentUser = try? JSONDecoder().decode(User.self, from: data) {
            self.currentUser = currentUser
        } else {
            currentUser.saveCurrentUser()
        }
    }
}
