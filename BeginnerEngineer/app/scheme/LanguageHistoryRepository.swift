//
//  LanguageHistoryRepository.swift
//  BeginnerEngineer
//
//  Created by works on 2021/09/10.
//

import RealmSwift

class LanguageHistoryRepository {
    
    // insert
    public func save(_ languageHistory: LanguageHistory) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(languageHistory)
        }
    }
    
    // insert
    public func save(_ languageHistories: [LanguageHistory]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(languageHistories)
        }
    }
    
    public func findBySearchHistoryId(_ id: String) {
        let realm = try! Realm()
        //try
    }
}
