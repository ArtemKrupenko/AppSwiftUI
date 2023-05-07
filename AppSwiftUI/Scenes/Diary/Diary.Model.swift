//
//  Diary.Model.swift
//  AppSwiftUI
//
//  Created by Артем on 01.05.2023.
//

import Foundation

struct Diary: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    let date: Date
    var text: String
    var sectionName: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, date, text, sectionName
    }

    init(id: UUID = UUID(), title: String, date: Date, text: String, sectionName: String) {
        self.id = id
        self.title = title
        self.date = date
        self.text = text
        self.sectionName = sectionName
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(UUID.self, forKey: .id)
        let title = try container.decode(String.self, forKey: .title)
        let date = try container.decode(Date.self, forKey: .date)
        let text = try container.decode(String.self, forKey: .text)
        let sectionName = try container.decode(String.self, forKey: .sectionName)
        self.init(id: id, title: title, date: date, text: text, sectionName: sectionName)

    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(date, forKey: .date)
        try container.encode(text, forKey: .text)
        try container.encode(sectionName, forKey: .sectionName)
    }
}

struct DiarySection: Identifiable, Hashable {
    let id = UUID()
    let nameSection: String
}
