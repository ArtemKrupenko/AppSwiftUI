//
//  Calendar.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 23.04.2023.
//

import SwiftUI

final class CalendarViewModel: ObservableObject {
    
    @Published var model = CalendarModel()
    @Published private var selectedMoods: [String: String] {
        didSet {
            storage.setValue(selectedMoods, forKey: StringValues.moods)
        }
    }
    
    private let storage = UserDefaults.standard
    
    init() {
        let formatter = DateFormatter()
        formatter.standaloneMonthSymbols = formatter.monthSymbols
        self.selectedMoods = storage.dictionary(forKey: StringValues.moods) as? [String: String] ?? [:]
    }
    
    func selectMood(for date: Date, mood: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = StringValues.dateFormat
        let dateString = formatter.string(from: date)
        selectedMoods[dateString] = mood
        self.selectedMoods = selectedMoods
    }
    
    func selectMood(for date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = StringValues.dateFormat
        let dateString = formatter.string(from: date)
        return selectedMoods[dateString]
    }
    
    func didTapPrevMonth() {
        model.monthOffset -= 1
    }
    
    func didTapNextMonth() {
        model.monthOffset += 1
    }
}
