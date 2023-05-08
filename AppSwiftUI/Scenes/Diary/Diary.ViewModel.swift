//
//  Diary.ViewModel.swift
//  AppSwiftUI
//
//  Created by Артем on 01.05.2023.
//

import Foundation

final class DiaryViewModel: ObservableObject {
    
    var indexDict: [String: Int] = [:]
    @Published var entries: [String: [[Diary]]] = [:]

    @Published var sections: [DiarySection] = [
        .init(nameSection: StringValues.gratitudeButton),
        .init(nameSection: StringValues.achievementsButton),
        .init(nameSection: StringValues.notesButton)
    ]

    @Published var selectedSectionIndex: Int? = nil
    
    let router: Router
    
    init(router: Router) {
        self.router = router
        loadEntries()
    }
    
    // что-то тут не так
    func addEntry(title: String, text: String) {
        if !title.isEmpty {
            if let index = sections.firstIndex(where: { $0.nameSection == sections[selectedSectionIndex ?? 0].nameSection }) {
                let entry = Diary(title: String(title.prefix(16)), date: Date(), text: text, sectionName: sections[index].nameSection)

                if entries[entry.sectionName] == nil {
                    entries[entry.sectionName] = []
                }
                entries[entry.sectionName]?.append([entry])

                saveEntries()
                print("Записи сохранены: \(entries)")
            }
        }
    }

    func deleteEntry(entry: Diary) {
        if let sectionEntries = entries[entry.sectionName] {
            for index in 0..<sectionEntries.count {
                if let entryIndexToRemove = sectionEntries[index].firstIndex(where: { $0.id == entry.id}) {
                    entries[entry.sectionName]?[index].remove(at: entryIndexToRemove)
                    saveEntries()
                    break
                }
            }
        }
    }


    func updateEntry(id: UUID, title: String, text: String) {
        if !title.isEmpty {
            guard let section = entries.first(where: { $0.key == sections[selectedSectionIndex ?? 0].nameSection }),
                  let subIndex = section.value.firstIndex(where: { $0.first?.id == id }) else { return }

            let entry = Diary(id: id, title: title, date: Date(), text: text, sectionName: section.key)
            entries[section.key]?[subIndex] = [entry]

            saveEntries()
        }
    }
    
    
    func saveEntries() {
        let entriesData = try? JSONEncoder().encode(entries)
        UserDefaults.standard.set(entriesData, forKey: StringValues.entries)
        print("Записи сохранены в UserDefaults")
    }

    func loadEntries() {
        if let entriesData = UserDefaults.standard.data(forKey: StringValues.entries) {
            if let entries = try? JSONDecoder().decode([String: [[Diary]]].self, from: entriesData) {
                self.entries = entries
            }
            print("Записи загружены: \(entries)")
        }
    }
    
    func entries(for sectionIndex: Int?) -> [Diary] {
        if let sectionIndex = sectionIndex {
            let sectionName = sections[sectionIndex].nameSection
            return entries[sectionName]?.flatMap { $0 } ?? []
        } else {
            return []
        }
    }
    
    func setEntries(entries: [Diary], for sectionIndex: Int?) {
        guard let sectionIndex = sectionIndex else { return }
        let sectionName = sections[sectionIndex].nameSection
        self.entries[sectionName]?[0] = entries
        saveEntries()
    }
}
