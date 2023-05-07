//
//  Motivation.View.swift
//  AppSwiftUI
//
//  Created by Артем on 31.03.2023.
//

import SwiftUI

struct MotivationView: View {
    
    @StateObject var viewModel: MotivationViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundViewApp()
                RoundedRectangle(cornerRadius: 20)
                    .gradientModifierGold().cornerRadius(20)
                    .frame(width: 270, height: 370)
                    .shadow(radius: 20)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 20).stroke(.black).opacity(0.2)
                    })
                VStack {
                    Text(viewModel.quote.randomQuote[0])
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .bold))
                        .padding()
                        .frame(width: 270, height: 270, alignment: .center)
                        .multilineTextAlignment(.center)
                    Text(viewModel.quote.randomQuote[1])
                        .foregroundColor(.black)
                        .font(.footnote)
                    Button {
                        viewModel.randomMotivation()
                    } label: {
                        Text(StringValues.more)
                            .frame(width: 80)
                            .buttonGold()
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 20).stroke(.black).opacity(0.2)
                            })
                    }
                }
            }
        }
    }
}

struct MotivationView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationView(viewModel: MotivationViewModel())
    }
}
