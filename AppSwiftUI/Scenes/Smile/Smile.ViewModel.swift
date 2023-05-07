//
//  Smile.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 18.04.2023.
//

import SwiftUI
import Foundation

final class SmileViewModel: ObservableObject {
    
    @ObservedObject var calendarViewModel = CalendarViewModel()
    
    func selectMood(for date: Date, mood: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = StringValues.dateFormat
        guard let date = formatter.date(from: formatter.string(from: date)) else { return }
        calendarViewModel.selectMood(for: date, mood: mood)
    }
}
