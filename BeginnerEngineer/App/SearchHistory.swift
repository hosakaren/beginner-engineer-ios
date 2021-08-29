//
//  SearchHistory.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/29.
//

import RealmSwift

class SearchHistory: Object {
    
    // id
    dynamic var id: String = NSUUID().uuidString
    // キーワードカラム
    @objc dynamic var key_word: String?
    // yyyy/MMカラム
    @objc dynamic var year_month: String?
    // language listカラム
    @objc dynamic var language_list: [String]?
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
