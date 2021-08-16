//
//  CalendarListViewController.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/10.
//

import Foundation
import UIKit
import FSCalendar
import CalculateCalendarLogic

class CalendarListViewController:
    UIViewControllerBase,
    FSCalendarDelegate,
    FSCalendarDataSource,
    FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        
        //スクロールの方向
        self.calendar.scrollDirection = .vertical
                
        //日本語設定
        self.setJapaneseCalendar()
        
        let mainColor = UIColor(named: "main_color")
        self.calendar.calendarHeaderView.backgroundColor = mainColor
        self.calendar.calendarWeekdayView.backgroundColor = mainColor
        
        //self.calendar.collectionView.cellForItem(at: <#T##IndexPath#>)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = StringEnum.yyyyMMdd.rawValue
        return formatter
    }()
    
    // 祝日判定を行い結果を返すメソッド(True:祝日)
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        // CalculateCalendarLogic()：祝日判定のインスタンスの生成
        let holiday = CalculateCalendarLogic()
        
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    //曜日判定(日曜日:1 〜 土曜日:7)
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする（祝日は赤色で表示する）
//        if self.judgeHoliday(date){
//            return UIColor.red
//        }
        
        //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
//        let weekday = self.getWeekIdx(date)
//        if weekday == 1 {   //日曜日
//            return UIColor.red
//        }
//        else if weekday == 7 {  //土曜日
//            return UIColor.blue
//        }
        
        return nil
    }
    
    func setJapaneseCalendar() {
        calendar.appearance.headerDateFormat = StringEnum.yyyyMM.rawValue
        calendar.locale = Locale(identifier: "ja")

    }
    
    // 今日ボタンタップ
    @IBAction func tapTodayButton(_ sender: Any) {
        calendar.setCurrentPage(getNextMonth(date: calendar.currentPage), animated: true)
    }
    
    func getNextMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: 0, to:date)!
    }
}
