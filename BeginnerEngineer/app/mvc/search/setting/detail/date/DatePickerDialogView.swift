//
//  DatePickerDialogView.swift
//  BeginnerEngineer
//
//  Created by works on 2021/08/27.
//

import UIKit

class DatePickerDialogView: UIView {
    
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var monthPicker: UIPickerView!
        
    private var YEAR_LIST: [Int] {
        return (Array<Int>)(initialYear...thisYear)
    }
    private let MONTH_LIST: [Int] = (Array<Int>)(1...12)
    
    private var selectedYear: Int?
    private var selectedMonth: Int?
    
    private let initialYear: Int = 2020
    private let thisYear = Calendar.current.component(.year, from: Date())
    private let thisMonth = Calendar.current.component(.month, from: Date())
    
    public func setUpView() {
        selectedYear = self.YEAR_LIST[0]
        selectedMonth = self.MONTH_LIST[0]
        
        let yearIndex = YEAR_LIST.firstIndex(of: AppData.shared.selectedYear ?? thisYear) ?? 0
        let monthIndex = MONTH_LIST.firstIndex(of: AppData.shared.selectedMonth ?? thisMonth) ?? 0

        self.yearPicker.selectRow(yearIndex, inComponent: 0, animated: false)
        self.monthPicker.selectRow(monthIndex, inComponent: 0, animated: false)
    }
    
    private func createYearList(_ initialYear: Int) -> [Int] {
        return (Array<Int>)(initialYear...thisYear)
    }
    
    // 後々汎用性ができるように改善
    @IBAction func tapOkBtn(_ sender: Any) {
        AppData.shared.selectedYearMonth =
            String(selectedYear ?? thisYear) + StringEnum.year.rawValue
            + String(selectedMonth ?? thisMonth) + StringEnum.month.rawValue
        
        AppData.shared.selectedYear = selectedYear ?? thisYear
        AppData.shared.selectedMonth = selectedMonth ?? thisMonth
        
        let searchSettingViewController = UIApplication.topViewController() as! SearchSettingViewController
        
        let yearIndex = YEAR_LIST.firstIndex(of: AppData.shared.selectedYear ?? thisYear) ?? 0
        let monthIndex = MONTH_LIST.firstIndex(of: AppData.shared.selectedMonth ?? thisMonth) ?? 0
        
        searchSettingViewController.dateViewAreaLabel.text =
            String(self.YEAR_LIST[yearIndex]) + StringEnum.year.rawValue
            + String(self.MONTH_LIST[monthIndex]) + StringEnum.month.rawValue
        
        self.removeFromSuperview()
    }
}

extension DatePickerDialogView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    // UIPickerViewの行数（リスト数）
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case yearPicker:
            return self.YEAR_LIST.count
        case monthPicker:
            return self.MONTH_LIST.count
        default: return 0
        }
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case yearPicker:
            return String(self.YEAR_LIST[row]) + StringEnum.year.rawValue
        case monthPicker:
            return String(self.MONTH_LIST[row]) + StringEnum.month.rawValue
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case yearPicker:
            selectedYear = self.YEAR_LIST[row]
        default:
            selectedMonth = self.MONTH_LIST[row]
        }
    }
}
