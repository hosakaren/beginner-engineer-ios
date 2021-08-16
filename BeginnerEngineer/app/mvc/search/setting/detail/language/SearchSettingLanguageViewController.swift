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
    
    private let laguageList: [(labelText: String, isTapped: Bool)] = [
        (labelText: StringEnum.java.rawValue, isTapped: false),
        (labelText: StringEnum.python.rawValue, isTapped: false),
        (labelText: StringEnum.ruby.rawValue, isTapped: false),
        (labelText: StringEnum.php.rawValue, isTapped: false),
        (labelText: StringEnum.javasc.rawValue, isTapped: false),
        (labelText: StringEnum.typescript.rawValue, isTapped: false),
        (labelText: StringEnum.kotlin.rawValue, isTapped: false),
        (labelText: StringEnum.swift.rawValue, isTapped: false),
        (labelText: StringEnum.go.rawValue, isTapped: false),
        (labelText: StringEnum.c.rawValue, isTapped: false),
        (labelText: StringEnum.csharp.rawValue, isTapped: false),
        (labelText: StringEnum.cplusplus.rawValue, isTapped: false),
        (labelText: StringEnum.html_css.rawValue, isTapped: false),
        (labelText: StringEnum.otherLang.rawValue, isTapped: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SearchSettingLanguageCellTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchSettingLanguageCellTableViewCell")
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
        // セルに表示する値を設定する
        cell.langlabel!.text = laguageList[indexPath.row].labelText
        
        return cell
    }
    
    // セルの高さ指定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // セルタップ(選択)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルを取得する
        let cell = tableView.cellForRow(at: indexPath) as! SearchSettingLanguageCellTableViewCell
        let isHidden: Bool = cell.checkMarkImage.isHidden
        if isHidden {
            cell.checkMarkImage.isHidden = false
        } else {
            cell.checkMarkImage.isHidden = true
        }
    }
    
//    // セルタップ(解除)
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        // セルを取得する
//        let cell = tableView.cellForRow(at: indexPath) as! SearchSettingLanguageCellTableViewCell
//        cell.checkMarkImage.isHidden = false
//    }
}
