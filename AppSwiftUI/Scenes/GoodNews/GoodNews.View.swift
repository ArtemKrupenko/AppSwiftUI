//
//  GoodNewsView.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI

struct GoodNewsView: View {
    
    @EnvironmentObject var menuViewModel: MenuViewModel
    
    var body: some View {
        ZStack {
            backgroundViewApp()
            VStack {
                VStack {
                    Spacer(minLength: 140)
                    HStack {
                        Text(StringValues.goodNews)
                            .textTitle()
                        menuButton()
                    }
                    Text(StringValues.goodNewsLabel)
                        .textLabel()
                    Spacer()
                }
                .frameTitleMenu()
                Spacer()
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

struct GoodNewsView_Previews: PreviewProvider {
    static var previews: some View {
        GoodNewsView()
    }
}

struct dataType: Identifiable {
    
    var id: String
    var title: String
    var desc: String
    var url: String
    var image: String
}

class getData: ObservableObject {
    @Published var dates = [dataType]()
    
    init() {
        let source = "https://vk.com/dobriememes"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) { (data, _, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            
//            for i in json
            
        }
    }
}
