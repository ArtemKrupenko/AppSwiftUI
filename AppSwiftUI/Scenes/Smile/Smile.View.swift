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
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundViewApp()
                VStack(spacing: 20) {
                    Text(StringValues.moodLabel)
                        .font(.footnote)
                        .frame(width: 300, height: 60, alignment: .center)
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
                    CalendarView(calendarViewModel: calendarViewModel)
                    Spacer().frame(height: 50)
                }.navigationBarTitle(StringValues.moodCalendar, displayMode: .inline)
            }
        }
    }
}

struct SmileView_Previews: PreviewProvider {
    static var previews: some View {
        SmileView(viewModel: SmileViewModel())
    }
}
