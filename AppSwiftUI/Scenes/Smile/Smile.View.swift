//
//  Smile.View.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI

struct SmileView: View {
    
    @StateObject var viewModel: SmileViewModel
    @StateObject var calendarViewModel = CalendarViewModel()
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    var body: some View {
        ZStack {
            backgroundViewApp()
            VStack {
                VStack(spacing: 10) {
                    Spacer(minLength: 40)
                    HStack {
                        Text(StringValues.moodCalendar)
                            .textTitle()
                        menuButton()
                    }
                    Text(StringValues.moodLabel)
                        .font(.footnote)
                        .frame(width: 340, height: 60, alignment: .center)
                        .multilineTextAlignment(.center)
                    HStack {
                        ForEach(StringValues.smiley.indices, id: \.self) { index in
                            Button {
                                let date = Date()
                                calendarViewModel.selectMood(for: date, mood: StringValues.smiley[index])
                            } label: {
                                Text(StringValues.smiley[index]).imageIconSmile()
                            }
                        }
                    }
                    Spacer().frame(height: 30)
                    CalendarView(calendarViewModel: calendarViewModel)
                    Spacer().frame(height: 50)
                }
                .foregroundColor(.primary)
            }
            .accentColor(.primary)
            .environmentObject(menuViewModel)
        }
    }
    
    @ViewBuilder
    private func menuButton() -> some View {
        if menuViewModel.sideButton {
            Button {
                withAnimation(.spring(response: 0.9, dampingFraction: 0.7)) {
                    menuViewModel.toggleMenu()
                }
            } label: {
                Image(systemName: StringValues.menuIcon)
                    .font(.title)
                    .foregroundColor(Color(StringValues.buttonColor))
            }
            .frame(width: 20, alignment: .trailing)
        }
    }
}
