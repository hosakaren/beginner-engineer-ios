//
//  CalendarViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/10.
//

import UIKit
import Foundation
import FSCalendar
import CalculateCalendarLogic

class CalendarViewController:
    UIViewControllerBase,
    FSCalendarDelegate,
    FSCalendarDataSource,
    FSCalendarDelegateAppearance {
    
    // カレンダー
    @IBOutlet weak var calendar: FSCalendar!
    
    // ストーリーボード読み込み
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        //スクロールの方向
        self.calendar.scrollDirection = .horizontal
        self.calendar.setScope(.week, animated: false)

        //日本語設定
        self.setJapaneseCalendar()
        
        let mainColor = UIColor(named: "main_color")
        self.calendar.calendarHeaderView.backgroundColor = mainColor
        self.calendar.calendarWeekdayView.backgroundColor = mainColor
    }
    
    // プラスボタンタップ
    @IBAction func tapPlsBtn(_ sender: Any) {
        
    }
    
//    // カレンダーボタンタップ
//    @IBAction func tapCalendarBtn(_ sender: Any) {
//        self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.calendarListViewId)
//    }
    
    func setJapaneseCalendar() {
        calendar.appearance.headerDateFormat = StringEnum.yyyyMM.rawValue
        calendar.locale = Locale(identifier: "ja")
    }
}
