//
//  Calendar.Model.swift
//  AppSwiftUI
//
//  Created by Артем on 23.04.2023.
//

import SwiftUI

struct CalendarModel {
    
    let daysPerWeek = 7
    let monthFormatter = DateFormatter()
    let calendar = Calendar(identifier: .gregorian)
    let allMonth = StringValues.allMonth
    var monthOffset = 0
    
    init() {
        monthFormatter.locale = Locale(identifier: StringValues.localeRU)
        monthFormatter.dateFormat = StringValues.dateFormatLLLL
        var allMonths: [String] = allMonth
        for month in 1...12 {
            if let date = calendar.date(from: DateComponents(year: 2023, month: month, day: 1)) {
                let monthString = monthFormatter.string(from: date)
                allMonths.append(monthString)
            }
        }
    }
    
    var currentMonth: String {
        if let currentMonthDate = calendar.date(byAdding: .month, value: monthOffset, to: Date()) {
            let currentMonth = monthFormatter.string(from: currentMonthDate)
            let firstLetterRange = currentMonth.startIndex...currentMonth.startIndex
            let capitalizedMonth = currentMonth.replacingCharacters(in: firstLetterRange, with: String(currentMonth[currentMonth.startIndex]).capitalized)
            return capitalizedMonth
        } else {
            return StringValues.nul
        }
    }
    
    var year: Int {
        calendar.component(.year, from: Date())
    }
    
    var month: Int {
        calendar.component(.month, from: Date()) + monthOffset
    }
    
    func dateFor(row: Int, col: Int) -> Date? {
        let firstOfMonth = calendar.date(from: DateComponents(year: year, month: month))
        let firstDayOfWeek = calendar.component(.weekday, from: firstOfMonth ?? Date())
        let dayOffset = (1 - firstDayOfWeek) + (row * 7) + col
        return calendar.date(byAdding: .day, value: dayOffset, to: firstOfMonth ?? Date())
    }
    
    func numberOfWeeksInMonth() -> Int {
        let firstOfMonth = calendar.date(from: DateComponents(year: year, month: month)) ?? Date()
        let rangeOfWeeks = calendar.range(of: .weekOfMonth, in: .month, for: firstOfMonth)
        return rangeOfWeeks?.count ?? 0
    }
}

extension Calendar {
    func endOfMonth(for date: Date) -> Date? {
        guard let range = range(of: .day, in: .month, for: date) else { return nil }
        let dayCount = range.count
        let diff = dayCount - component(.day, from: date) + 1
        return date.addingTimeInterval(TimeInterval(60 * 60 * 24 * diff))
    }
}
