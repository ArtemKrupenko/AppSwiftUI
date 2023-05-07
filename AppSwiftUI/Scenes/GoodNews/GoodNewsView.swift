//
//  GoodNewsView.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI

struct GoodNewsView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundViewApp()
                Text("Здесь будут хорошие новости,  \nдобрые мемы и различные милые картинки")
                    .frame(width: 350, height: 80, alignment: .center)
                    .multilineTextAlignment(.center)
            }
            .navigationBarTitle(StringValues.goodNews, displayMode: .inline)
        }
    }
}

struct GoodNewsView_Previews: PreviewProvider {
    static var previews: some View {
        GoodNewsView()
    }
}
