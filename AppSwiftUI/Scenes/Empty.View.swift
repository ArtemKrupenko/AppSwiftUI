//
//  EmptyView.swift
//  AppSwiftUI
//
//  Created by Артем on 04.05.2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        NavigationView {
            ZStack {
                backgroundViewApp()
                Text("Пустой экран")
            }
        }
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
