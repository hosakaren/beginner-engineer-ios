//
//  CalendarViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/10.
//

import UIKit
import Foundation

class CalendarViewController: UIViewControllerBase {
    
    // ストーリーボード読み込み
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // カレンダーボタンタップ
    @IBAction func tapCalendarBtn(_ sender: Any) {
        self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.calendarListViewId)
    }
    
    // 投稿ボタンタップ
    @IBAction func tapRegisterBtn(_ sender: Any) {
    }
}
