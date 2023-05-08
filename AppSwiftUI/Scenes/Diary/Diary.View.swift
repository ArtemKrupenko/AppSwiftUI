//
//  Diary.View.swift
//  AppSwiftUI
//
//  Created by Артем on 01.05.2023.
//

import SwiftUI

struct DiaryView: View {
    
    @EnvironmentObject var menuViewModel: MenuViewModel
    @StateObject var viewModel = DiaryViewModel(router: Router())

    var body: some View {
        backgroundViewApp()
        VStack {
            VStack {
                Spacer(minLength: 140)
                HStack {
                    Text(StringValues.diary)
                        .textTitle()
                    menuButton()
                }
                Text(StringValues.diaryLabel)
                    .textLabel()
                entriesView
                Spacer()
            }
            .frame(width: 360, height: 300, alignment: .leading)
            .foregroundColor(.primary)
            Spacer()
        }
        .onAppear {
            viewModel.loadEntries()
        }
        .accentColor(.primary)
        .environmentObject(menuViewModel)
    }
    
    private var entriesView: some View {
        VStack(spacing: 10) {
            ForEach(viewModel.sections) { section in
                NavigationLink(destination: getDestinationView(for: section)) {
                    Text(section.nameSection)
                        .frame(width: 350)
                        .buttonGold()
                }
            }
        }
    }
    
    func getDestinationView(for section: DiarySection) -> AnyView {
        switch section {
        case viewModel.sections[0]:
            let viewModel = GratitudeListViewModel(diaryViewModel: viewModel, sectionIndex: 0)
            return AnyView(GratitudeListView(viewModel: viewModel))
        case viewModel.sections[1]:
            let viewModel = AchievementsListViewModel(diaryViewModel: viewModel, sectionIndex: 1)
            return AnyView(AchievementsListView(viewModel: viewModel))
        case viewModel.sections[2]:
            // TODO: - Исправить на новый раздел
            let viewModel = AchievementsListViewModel(diaryViewModel: viewModel, sectionIndex: 1)
            return AnyView(AchievementsListView(viewModel: viewModel))
        default:
            fatalError()
        }
    }
    
    @ViewBuilder
    private func menuButton() -> some View {
        if menuViewModel.sideButton {
            Button {
                withAnimation(.spring(response: 0.9, dampingFraction: 0.7)) {
                    menuViewModel.toggleMenu()
                }
            } label: {
                Image(systemName: StringValues.menuIcon)
                    .font(.title)
                    .foregroundColor(Color(StringValues.buttonColor))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
            .environmentObject(Router())
    }
}
