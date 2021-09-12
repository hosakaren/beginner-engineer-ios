//
//  SearhHistoryRepository.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/29.
//

import RealmSwift

class SearhHistoryRepository {
    
    // insert
    public func save(_ searchHistory: SearchHistory) {
        let realm = try! Realm()
        try! realm.write{
            realm.add(searchHistory)
        }
    }
    
    // insert(List)
    public func save(_ searchHistories: [SearchHistory]) {
        let realm = try! Realm()
        try! realm.write{
            realm.add(searchHistories)
        }
    }
    
    public func findOne() {
        let realm = try! Realm()
        let searchHistory = realm.objects(SearchHistory.self)
        print(searchHistory)
    }
}
