//
//  SearchSettingViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/12.
//

import UIKit
import Foundation

class SearchSettingViewController: UIViewControllerBase {
    
    // 日付選択ビューエリア
    @IBOutlet weak var dateViewArea: UIView!
    // 言語選択エリア
    @IBOutlet weak var languageViewArea: UIView!
    //日付選択ビューエリアラベル
    @IBOutlet weak var dateViewAreaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //日付選択ビューエリアタップ登録
        let tapDateViewArea = UITapGestureRecognizer(target: self, action: #selector(tapDateViewArea))
        self.dateViewArea.addGestureRecognizer(tapDateViewArea)

        // 言語エリアをタップ登録
        let tapLangViewArea = UITapGestureRecognizer(target: self, action: #selector(tapLanguageViewArea))
        self.languageViewArea.addGestureRecognizer(tapLangViewArea)
    }
    
    // 日付選択エリアタップ
    @objc func tapDateViewArea(){
        
    }
    
    // 言語エリアをタップ
    @objc func tapLanguageViewArea(){
        self.transitionStoryBoard(sbEnum: .searchSettingLanguageViewId)
    }
}
