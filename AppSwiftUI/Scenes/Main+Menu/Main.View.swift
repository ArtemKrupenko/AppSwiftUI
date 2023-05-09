//
//  MainView.swift
//  AppSwiftUI
//
//  Created by Артем on 21.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var menuViewModel = MenuViewModel()
    @StateObject var mainViewModel = MainViewModel(user: User(name: StringValues.nul))
    
    var body: some View {
        ZStack {
            switch mainViewModel.selectedView {
            case .diary:
                DiaryView(viewModel: DiaryViewModel(router: Router()))
            case .moodCalendar:
                SmileView(viewModel: SmileViewModel())
            case .home:
                HomeView()
            case .motivation:
                MotivationView(viewModel: MotivationViewModel())
            case .goodNews:
                GoodNewsView()
            case .aboutApp:
                EmptyView()
            case .feedback:
                EmptyView()
            case .telegram:
                EmptyView()
            }
            
            if menuViewModel.isMenuOpen {
                MenuView(mainViewModel: mainViewModel)
                    .transition(.move(edge: .leading))
            }
        }
        .environmentObject(menuViewModel)
        .environmentObject(mainViewModel)
    }
}

//struct MainView: View {
//
//    @StateObject var mainViewModel: MainViewModel
//    @State var selectedTab = StringValues.home
//
//    var body: some View {
//        VStack(spacing: 0) {
//            ZStack {
//                switch mainViewModel.selectedView {
//                case 0:
//                    let viewModel = DiaryViewModel(router: Router())
//                    DiaryView(viewModel: viewModel)
//                case 1:
//                    let viewModel = SmileViewModel()
//                    SmileView(viewModel: viewModel)
//                case 2:
////                    let viewModel = MainViewModel(user: mainViewModel.user)
//                    HomeView()
//                case 3:
//                    let viewModel = MotivationViewModel()
//                    MotivationView(viewModel: viewModel)
//                case 4:
//                    GoodNewsView()
//                default:
//                    fatalError()
//                }
//            }
//
//            Divider().padding(.bottom, 10)
//            HStack {
//                ForEach(0..<5, id: \.self) { number in
//                    Spacer()
//                    Button(action: {
//                        self.mainViewModel.selectedView = number
//                    }, label: {
//                        if number == 2 {
//                            Image(systemName: arrayIconsTabBar[number].icon)
//                                .foregroundColor(mainViewModel.selectedView == number ? Color(StringValues.buttonColor).opacity(1) : Color(.label))
//                                .imageIconHome()
//                        } else {
//                            Image(systemName: arrayIconsTabBar[number].icon)
//                                .font(.system(size: 25, weight: .semibold, design: .default))
//                                .foregroundColor(mainViewModel.selectedView == number ? Color(StringValues.goldButton).opacity(1) : Color(.label))
//                        }
//                    })
//                    Spacer()
//                }
//            }
//            Spacer()
//        }
//        .environmentObject(mainViewModel)
//    }
//}
