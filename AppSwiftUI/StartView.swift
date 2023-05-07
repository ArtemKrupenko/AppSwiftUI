//
//  StartView.swift
//  AppSwiftUI
//
//  Created by Артем on 21.03.2023.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = ""
}

struct StartView: View {
    @ObservedObject var user = User()
    
    @State var isPressStart = false
    @FocusState var nameIsFocused: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Познакомимся?").font(.title).bold()
                Text("Привет! Я тюлень по имени ______" + "\n" + "А как зовут тебя?").font(.title2)
                TextField("Имя", text: $user.name).focused($nameIsFocused).whiteTextField()
                Button {
                    isPressStart = true
                    nameIsFocused = false
                } label: {
                    Text("Начать")
                }.brownButton()
            }.background(Image("welcome-seal"))
                .fullScreenCover(isPresented: $isPressStart) {
                    MainView()
                }
        }.environmentObject(user)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

// MARK: - Text
//Text("Привет!")
//Text("Привет!").padding()
//Text("Привет!".lowercased())                                   - все буквы с маленькой буквы
//Text("Привет!".uppercased())                                   - все буквы с большой буквы
//Text("Привет!").kerning(5)                                     - пробелы между буквами (на указанное значение)
//Text("Привет!").italic()                                       - какой-то стиль (например italic)
//Text("Привет!").font(.title)                                   - выбор шрифта
//Text("Привет!").bold()                                         - жирный шрифт
//Text("Привет!").underline()                                    - нижнее подчеркивание
//Text("Привет!").strikethrough()                                - зачеркнутый текст
//Text("Привет!").strikethrough(true, color: .red)               - можно линию покрасить в цвет (и underline)
//Text("Привет!").background(.red)                               - фон где находится текст
//Text("Привет!").foregroundColor(Color.red)                     - цвет текста
//Text("Привет!").foregroundColor(Color("1"))                    - цвет текста (из Assets)
//Text("Привет!").lineLimit(1)                                   - количество линий текста (в данном примере 1)
//Text("Привет!").multilineTextAlignment(.center)                - расположение текста (leading и trailing)
//Text("Привет!").lineSpacing(10)                                - расстояние между строками
//Text("Привет!").frame(width: 200, height: 100, alignment: .leading)
//Text("Привет!").offset(x: isOnToggle ? 100 : 0)
//Text("Привет!").navigationBarTitle("Меню")
//Text("Привет!").baselineOffset(10)
//Text("Привет!").minimumScaleFactor(0.5)
//Text(company[$0]).tag($0)
//Text("Привет!").font(.system(size: 24,
//                             weight: .bold,
//                             design: .serif))
//Text("Привет!").font(.title.bold()).padding().frame(width: 270,
//                                                    height: 270,
//                                                    alignment: .center).multilineTextAlignment(.center)
