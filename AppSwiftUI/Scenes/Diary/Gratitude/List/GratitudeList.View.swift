//
//  GratitudeList.View.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import SwiftUI

struct GratitudeListView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: GratitudeListViewModel
    var selectedSectionIndex: Int?
        
    var body: some View {
        VStack {
            Text(StringValues.gratitudeLabel)
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 110)
                .cornerRadius(10)
                .foregroundColor(.primary)
            if viewModel.entries == [] {
                backgroundViewApp()
                .navigationBarTitle(StringValues.gratitude, displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: GratitudeFormView(viewModel: GratitudeFormViewModel(diaryViewModel: viewModel.diaryViewModel))) {
                            Image(systemName: StringValues.plus)
                                .foregroundColor(Color(StringValues.goldButton))
                        }
                    }
                }
            } else {
                List {
                    ForEach(viewModel.entries) { entry in
                        NavigationLink(
                            destination: GratitudeDetailView(
                                viewModel: GratitudeDetailViewModel(
                                    entry: entry,
                                    diaryViewModel: viewModel.diaryViewModel)
                            )
                        ) {
                            VStack(alignment: .leading) {
                                Text(entry.title)
                                    .font(.title3.bold())
                                    .foregroundColor(Color(StringValues.goldButton))
                                Text(entry.date.ISO8601Format(.iso8601Date(timeZone: .current)))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .navigationBarTitle(StringValues.gratitude, displayMode: .inline)
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: GratitudeFormView(viewModel: GratitudeFormViewModel(diaryViewModel: viewModel.diaryViewModel))) {
                            Image(systemName: StringValues.plus)
                                .foregroundColor(Color(StringValues.goldButton))
                        }
                    }
                }
            }
        }.background(backgroundViewApp())
    }
}
