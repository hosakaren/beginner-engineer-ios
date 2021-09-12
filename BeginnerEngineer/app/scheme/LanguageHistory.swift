//
//  LanguageHistory.swift
//  BeginnerEngineer
//
//  Created by works on 2021/09/08.
//

import RealmSwift

class LanguageHistory: Object {
    
    // id
    @objc dynamic var id: String = NSUUID().uuidString
    // 言語
    @objc dynamic var language: String!
    // SearchHistory id
    @objc dynamic var search_history_id: String!
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    public func createObj(languege: String!, searchHistoryId: String) -> LanguageHistory {
        let languageHistoryObj = LanguageHistory()
        languageHistoryObj.language = language
        languageHistoryObj.search_history_id = search_history_id
        return languageHistoryObj
    }
}
