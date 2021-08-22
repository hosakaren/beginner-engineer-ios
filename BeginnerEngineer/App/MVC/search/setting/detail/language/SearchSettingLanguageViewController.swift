//
//  SearchSettingLanguageViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/15.
//

import UIKit
import Foundation

class SearchSettingLanguageViewController: UIViewControllerBase {
    
    // テーブルビュー
    @IBOutlet weak var tableView: UITableView!
    
    private var laguageList: [(labelText: String, iHiddensCheckMarkImage: Bool)] = [
        (labelText: StringEnum.java.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.python.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.ruby.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.php.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.javasc.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.typescript.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.kotlin.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.swift.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.go.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.c.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.csharp.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.cplusplus.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.html_css.rawValue, iHiddensCheckMarkImage: true),
        (labelText: StringEnum.otherLang.rawValue, iHiddensCheckMarkImage: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // セパレーター削除
        tableView.separatorStyle = .none

        tableView.register(UINib(nibName: "SearchSettingLanguageCellTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchSettingLanguageCellTableViewCell")
    }
    // 戻るボタンタップ
    @IBAction func tapBackBtn(_ sender: Any) {
        super.tapBackBtn()
    }
    
    // 決定ボタンタップ
    @IBAction func tapDecidingBtn(_ sender: Any) {
        var checkedLanguageList: [String] = []
        for list in laguageList where !list.iHiddensCheckMarkImage {
            checkedLanguageList.append(list.labelText)
        }
        super.tapBackBtn()
    }
    
}

extension SearchSettingLanguageViewController: UITableViewDelegate, UITableViewDataSource {
    
    //セルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laguageList.count
    }
    
    //セルに値を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "SearchSettingLanguageCellTableViewCell", for: indexPath)
            as! SearchSettingLanguageCellTableViewCell
        let language = laguageList[indexPath.row]
        // セルに表示する値を設定する
        cell.setupCell(langLabelText: language.labelText, isHiddenCheckMarkImage: language.iHiddensCheckMarkImage)
        
        return cell
    }
    
    // セルの高さ指定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // セルタップ(選択)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let language = laguageList[indexPath.row]
        //リストの値書き換え
        laguageList[indexPath.row].iHiddensCheckMarkImage = !language.iHiddensCheckMarkImage
        // セルを取得する
        let cell = tableView.cellForRow(at: indexPath) as! SearchSettingLanguageCellTableViewCell
        cell.updateCell(langLabelText: laguageList[indexPath.row].labelText)
    }
}
