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
    
    // 未選択ラベル（言語）
    @IBOutlet weak var noLangLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.keyword.attributedPlaceholder = NSAttributedString(string: StringEnum.input_keyword.rawValue, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        //日付選択ビューエリアタップ登録
        let tapDateViewArea = UITapGestureRecognizer(target: self, action: #selector(self.tapDateViewArea))
        self.dateViewArea.addGestureRecognizer(tapDateViewArea)
        
        // 言語エリアをタップ登録
        let tapLangViewArea = UITapGestureRecognizer(target: self, action: #selector(self.tapLanguageViewArea))
        self.languageViewArea.addGestureRecognizer(tapLangViewArea)
    }
    
    // 画面に戻ってきたとき
    override open func viewWillAppear(_ animated: Bool) {
        if !self.appData.selectedLanguage.isEmpty {
            self.noLangLabel.text = String(self.appData.selectedLanguage.count) + StringEnum.count_unit.rawValue
        }
    }
    
    // 戻るボタンタップ
    @IBAction func tapBackBtn(_ sender: Any) {
        super.tapBackBtn()
    }
    
    // 日付選択エリアタップ
    @objc func tapDateViewArea(){
        let dialogView = UINib(nibName: "DatePickerDialogView", bundle: nil)
            .instantiate(withOwner: nil, options: nil)
            .first as! DatePickerDialogView
        dialogView.frame = self.view.frame
        // ポップアップビュー背景色（グレーの部分）
        let viewColor = UIColor.init(named: "main_color")
        // 半透明にして親ビューが見えるように。透過度はお好みで。
        dialogView.backgroundColor = viewColor?.withAlphaComponent(0.5)
        dialogView.setUpView()
        self.view.addSubview(dialogView)
    }
    
    // 言語エリアをタップ
    @objc func tapLanguageViewArea(){
        self.transitionStoryBoard(sbEnum: .searchSettingLanguageViewId)
    }
    
    // リセットボタンタップ
    @IBAction func tapResetBtn(_ sender: Any) {
        // キーワードリセット
        self.keyword.text = ""
        // 言語リセット
        self.appData.selectedLanguage = []
        self.noLangLabel.text = StringEnum.no_selected.rawValue
        
        // 日付リセット
        self.dateViewAreaLabel.text = StringEnum.no_selected.rawValue
        self.appData.selectedYearMonth = ""
        self.appData.selectedYear = nil
        self.appData.selectedMonth = nil
    }
    
    // 検索ボタンタップ
    @IBAction func tapDoSearchBtn(_ sender: Any) {
        
//        let searchHistory = SearchHistory.createObj(
//            keyword: self.keyword.text,
//            yearMonth: self.appData.selectedYearMonth,
//            languageList: self.appData.selectedLanguage)
//        SearhHistoryRepository().save(searchHistory)
        SearhHistoryRepository().findOne()
        // 検索画面に遷移
        self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.searchViewId)
    }
    
}
