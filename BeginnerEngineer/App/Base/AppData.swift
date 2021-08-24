//
//  AppData.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/22.
//

import UIKit

// 一時的なアプリデータを保存
public class AppData: NSObject {
    // 初期化禁止
    private override init() {}
    // シングルトーン
    public static let shared = AppData()
    
    var selectedLanguage:[String] = []
}
