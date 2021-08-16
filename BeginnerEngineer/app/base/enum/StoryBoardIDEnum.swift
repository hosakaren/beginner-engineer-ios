//
//  StoryBoardIDEnum.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/10.
//

import Foundation

//命名規則
//case viewのスネークケースID = ファイル名
enum StoryBoardIDEnum {
    
    case calendarViewId
    case calendarListViewId
    
    case searchViewId
    case searchSettingViewId
    case searchSettingLanguageViewId
    
    func getStoryBoardIDEnumDetail() -> (name: String, isNavigationBar: Bool, isBottomTabBar: Bool, isAnimated: Bool) {
        switch self {
        case .calendarViewId:
            return (name: "CalendarView", isNavigationBar: true, isBottomTabBar: true, isAnimated: false)
        case .calendarListViewId:
            return (name: "CalendarListView", isNavigationBar: true, isBottomTabBar: false, isAnimated: true)
            
        case .searchViewId:
            return (name: "SearchView", isNavigationBar: true, isBottomTabBar: true, isAnimated: false)
        case .searchSettingViewId:
            return (name: "SearchSettingView", isNavigationBar: true, isBottomTabBar: true, isAnimated: false)
        case .searchSettingLanguageViewId:
            return (name: "SearchSettingLanguageView", isNavigationBar:true, isBottomTabBar: true, isAnimated: false)
        }
        
    }
}
