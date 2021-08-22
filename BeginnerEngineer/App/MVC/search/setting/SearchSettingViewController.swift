//
//  SearchSettingViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/12.
//

import UIKit
import Foundation

class SearchSettingViewController: UIViewControllerBase {
    //キーワード入力
    @IBOutlet weak var keyword: UITextField!
    // 日付選択ビューエリア
    @IBOutlet weak var dateViewArea: UIView!
    // 言語選択エリア
    @IBOutlet weak var languageViewArea: UIView!
    //日付選択ビューエリアラベル
    @IBOutlet weak var dateViewAreaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.keyword.attributedPlaceholder = NSAttributedString(string: "キーワードを入力", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        //日付選択ビューエリアタップ登録
        let tapDateViewArea = UITapGestureRecognizer(target: self, action: #selector(self.tapDateViewArea))
        self.dateViewArea.addGestureRecognizer(tapDateViewArea)

        // 言語エリアをタップ登録
        let tapLangViewArea = UITapGestureRecognizer(target: self, action: #selector(self.tapLanguageViewArea))
        self.languageViewArea.addGestureRecognizer(tapLangViewArea)
    }
    
    // 画面に戻ってきたとき
    override open func viewWillAppear(_ animated: Bool) {
        print(self.appData.selectedLanguage)
    }
    
    // 戻るボタンタップ
    @IBAction func tapBackBtn(_ sender: Any) {
        super.tapBackBtn()
    }
    
    // 日付選択エリアタップ
    @objc func tapDateViewArea(){
        
    }
    
    // 言語エリアをタップ
    @objc func tapLanguageViewArea(){
        self.transitionStoryBoard(sbEnum: .searchSettingLanguageViewId)
    }
}
