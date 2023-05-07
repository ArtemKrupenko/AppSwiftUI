//
//  GratitudeForm.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import Foundation

final class GratitudeFormViewModel: ObservableObject {
    
    let diaryViewModel: DiaryViewModel
    var router: Router?
    
    @Published var title: String = StringValues.nul
    @Published var text: String = StringValues.nul

    init(diaryViewModel: DiaryViewModel) {
        self.diaryViewModel = diaryViewModel
    }
    
    func addEntry() {
        if !title.isEmpty {
            diaryViewModel.addEntry(title: String(title.prefix(16)), text: text)
        }
        router?.reset()
        title = StringValues.nul
        text = StringValues.nul
    }
}
