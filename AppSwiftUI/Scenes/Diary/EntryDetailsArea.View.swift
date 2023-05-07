//
//  EntryDetailsArea.View.swift
//  AppSwiftUI
//
//  Created by Артем on 03.05.2023.
//

import SwiftUI

struct EntryDetailsAreaView: View {
    @Binding var title: String
    @Binding var text: String
    
    var body: some View {
        Section {
            TextField(StringValues.textField, text: Binding(
              get: { title },
              set: { title = String($0.prefix(16)) }
            ))
            TextEditor(text: $text)
        }
    }
}
