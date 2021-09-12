//
//  SearchHistory.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/29.
//

import RealmSwift

class SearchHistory: Object {
    
    // id
    @objc dynamic var id: String = NSUUID().uuidString
    // キーワードカラム
    @objc dynamic var key_word: String?
    // yyyy/MMカラム
    @objc dynamic var year_month: String?
    // language list
    private var languageList: [LanguageHistory]?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    public func createObj(keyword: String?, yearMonth: String?, languageList: [LanguageHistory]?) -> SearchHistory {
        let searchHistoryObj = SearchHistory()
        searchHistoryObj.key_word = keyword
        searchHistoryObj.year_month = yearMonth
        searchHistoryObj.languageList = languageList
        return searchHistoryObj
    }
    
}
