//
//  AchievementsList.View.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import SwiftUI

struct AchievementsListView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: AchievementsListViewModel
    var selectedSectionIndex: Int?
        
    var body: some View {
        VStack {
            Text(StringValues.achievementsLabel)
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 110)
                .cornerRadius(10)
                .foregroundColor(.primary)
            if viewModel.entries == [] {
                backgroundViewApp()
                .navigationBarTitle(StringValues.achievements, displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AchievementsFormView(viewModel: AchievementsFormViewModel(diaryViewModel: viewModel.diaryViewModel))) {
                            Image(systemName: StringValues.plus)
                                .foregroundColor(Color(StringValues.buttonColor))
                        }
                    }
                }
            } else {
                List {
                    ForEach(viewModel.entries) { entry in
                        NavigationLink(
                            destination: AchievementsDetailView(
                                viewModel: AchievementsDetailViewModel(
                                    entry: entry,
                                    diaryViewModel: viewModel.diaryViewModel)
                            )
                        ) {
                            VStack(alignment: .leading) {
                                Text(entry.title)
                                    .font(.title3.bold())
                                    .foregroundColor(Color(StringValues.buttonColor))
                                Text(entry.date.ISO8601Format(.iso8601Date(timeZone: .current)))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                .navigationBarTitle(StringValues.achievements, displayMode: .inline)
                .scrollContentBackground(.hidden)
                .background(backgroundViewApp())
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AchievementsFormView(viewModel: AchievementsFormViewModel(diaryViewModel: viewModel.diaryViewModel))) {
                            Image(systemName: StringValues.plus)
                                .foregroundColor(Color(StringValues.buttonColor))
                        }
                    }
                }
            }
        }.background(backgroundViewApp())
    }
}
