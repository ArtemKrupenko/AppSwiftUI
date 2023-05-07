//
//  GratitudeList.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import Foundation

final class GratitudeListViewModel: ObservableObject {
    
    let diaryViewModel: DiaryViewModel
    
    @Published var entries: [Diary] = []
    
    @Published var sectionIndex: Int
    
    init(diaryViewModel: DiaryViewModel, sectionIndex: Int) {
        self.diaryViewModel = diaryViewModel
        self.sectionIndex = sectionIndex
        entries = diaryViewModel.entries(for: sectionIndex).sorted(by: { $0.date > $1.date })
    }
}
