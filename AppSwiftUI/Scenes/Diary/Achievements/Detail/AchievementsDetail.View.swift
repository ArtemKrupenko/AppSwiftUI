//
//  AchievementsDetail.View.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import SwiftUI

struct AchievementsDetailView: View {
    
    @ObservedObject var viewModel: AchievementsDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var updatedTitle = StringValues.nul
    @State private var updatedText = StringValues.nul
    
    var body: some View {
        Form {
            EntryDetailsAreaView(title: $updatedTitle, text: $updatedText)
                .disabled(true)
            deleteButtonView
        }
        .navigationTitle(viewModel.title)
        .background(backgroundViewApp())
        .scrollContentBackground(.hidden)
        .onAppear {
            updatedTitle = viewModel.title
            updatedText = viewModel.text
        }
    }

    private var deleteButtonView: some View {
        Section {
            Button(StringValues.delete) {
                viewModel.deleteEntry()
                presentationMode.wrappedValue.dismiss()
            }
            .font(.title3.bold())
            .foregroundColor(.red)
        }
    }
}
