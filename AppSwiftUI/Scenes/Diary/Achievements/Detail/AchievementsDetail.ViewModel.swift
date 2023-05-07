//
//  AchievementsDetail.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import Foundation

final class AchievementsDetailViewModel: ObservableObject {
    
    let diaryViewModel: DiaryViewModel
    let entry: Diary
    
    @Published var title: String
    @Published var text: String
    
    init(entry: Diary, diaryViewModel: DiaryViewModel) {
        self.diaryViewModel = diaryViewModel
        self.entry = entry
        self.title = entry.title
        self.text = entry.text
    }
    
    func deleteEntry() {
        diaryViewModel.deleteEntry(entry: entry)
    }
}
