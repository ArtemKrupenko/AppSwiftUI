//
//  Diary.View.swift
//  AppSwiftUI
//
//  Created by Артем on 01.05.2023.
//

import SwiftUI

struct DiaryView: View {
    
    @StateObject var viewModel = DiaryViewModel(router: Router())

    var body: some View {
        NavigationStack {
            ZStack {
                backgroundViewApp()
                VStack(spacing: 10) {
                    titleView
                    entriesView
                    Spacer()
                }
                .padding(.vertical)
            }
            .navigationBarTitle(StringValues.diary, displayMode: .inline)
            .foregroundColor(.primary)
        }
        .onAppear {
            viewModel.loadEntries()
        }
        .accentColor(.primary)
    }
    
    private var titleView: some View {
        VStack {
            Text(StringValues.diaryLabel)
                .lineSpacing(5)
                .multilineTextAlignment(.center)
                .frame(width: 260, height: 150)
        }
    }
    
    private var entriesView: some View {
        VStack(spacing: 10) {
            ForEach(viewModel.sections) { section in
                NavigationLink(destination: getDestinationView(for: section)) {
                    Text(section.nameSection)
                        .frame(width: 250)
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
            return AnyView(EmptyView())
        default:
            fatalError()
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
            .environmentObject(Router())
    }
}
