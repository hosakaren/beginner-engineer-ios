//
//  SearchViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/12.
//

import UIKit
import Foundation

class SearchViewController: UIViewControllerBase {
    
    // 検索エリアView
    @IBOutlet weak var searchViewArea: UIView!
    // データなしラベル
    @IBOutlet weak var noDataLabel: UILabel!
    // テーブルView
    @IBOutlet weak var tableView: UITableView!
    // ストーリーボード読み込み
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 検索エリアをタップ登録
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapSearchViewArea))
        self.searchViewArea.addGestureRecognizer(tap)
        
        self.tableView.isHidden = true
    }
    
    // 検索エリアがタップされた時の挙動
    @objc func tapSearchViewArea() {
        self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.searchSettingViewId)
    }
    
}

