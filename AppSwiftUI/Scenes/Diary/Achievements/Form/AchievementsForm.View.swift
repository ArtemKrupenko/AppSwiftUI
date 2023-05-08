//
//  AchievementsForm.View.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import SwiftUI
    
struct AchievementsFormView: View {
    
    @ObservedObject var viewModel: AchievementsFormViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            EntryDetailsAreaView(title: $viewModel.title, text: $viewModel.text)
            saveButtonView
        }
        .navigationBarTitle(StringValues.entry, displayMode: .inline)
        .background(backgroundViewApp())
        .scrollContentBackground(.hidden)
    }
    
    private var saveButtonView: some View {
        Section {
            Button(StringValues.save) {
                viewModel.addEntry()
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title3.bold())
            .foregroundColor(Color(StringValues.buttonColor))
        }
    }
}
