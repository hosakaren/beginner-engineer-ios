//
//  SearchSettingViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/12.
//

import UIKit
import Foundation

class SearchSettingViewController: UIViewControllerBase {
    
    @IBOutlet weak var languageViewArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 言語エリアをタップ登録
        let tapLangViewArea = UITapGestureRecognizer(target: self, action: #selector(tapLanguageViewArea))
        self.languageViewArea.addGestureRecognizer(tapLangViewArea)
    }
    
    // 言語エリアをタップ
    @objc func tapLanguageViewArea(){
        self.transitionStoryBoard(sbEnum: .searchSettingLanguageViewId)
    }
}
