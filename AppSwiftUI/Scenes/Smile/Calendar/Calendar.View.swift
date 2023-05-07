//
//  Calendar.View.swift
//  AppSwiftUI
//
//  Created by Артем on 23.04.2023.
//

import SwiftUI

struct CalendarView: View {
    
    @ObservedObject var calendarViewModel = CalendarViewModel()
    @State private var selectedDate: Date? = nil
    
    var mood: String? {
         guard let selectedDate = selectedDate else {
             return nil
         }
         let selectedMood = calendarViewModel.selectMood(for: selectedDate)
         return selectedMood
     }
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Button(action: {
                    self.calendarViewModel.didTapPrevMonth()
                }) {
                    Image(systemName: StringValues.chevronLeft).foregroundColor(.primary)
                }
                Spacer()
                Text(calendarViewModel.model.currentMonth).font(.title2)
                Spacer()
                Button(action: {
                    self.calendarViewModel.didTapNextMonth()
                }) {
                    Image(systemName: StringValues.chevronRight).foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            GridView(rows: calendarViewModel.model.numberOfWeeksInMonth(), columns: calendarViewModel.model.daysPerWeek) { row, col in
                if let date = self.calendarViewModel.model.dateFor(row: row, col: col) {
                    let day = self.calendarViewModel.model.calendar.component(.day, from: date)
                    let isInMonth = self.calendarViewModel.model.calendar.component(.month, from: date) == self.calendarViewModel.model.calendar.component(.month, from: Date())
                    VStack {
                        Text(day.description)
                            .opacity(isInMonth ? 1 : 0.5)
                            .foregroundColor(isInMonth ? .primary : .secondary)
                        Text(calendarViewModel.selectMood(for: date) ?? StringValues.nul)
                            .opacity(isInMonth ? 1 : 0.5)
                            .foregroundColor(isInMonth ? .primary : .secondary)
                    }
                } else {
                    Text(StringValues.nul)
                }
            }
            
            Divider()
        }
    }
}

struct GridView<Content: View>: View {

    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
