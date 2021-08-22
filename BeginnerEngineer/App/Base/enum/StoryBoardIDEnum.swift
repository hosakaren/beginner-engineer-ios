//
//  StoryBoardIDEnum.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/10.
//

import Foundation

//命名規則
//case viewのスネークケースID = ファイル名
enum StoryBoardIDEnum: CaseIterable {
    
    case none
    
    case calendarViewId
    case calendarListViewId
    
    case searchViewId
    case searchSettingViewId
    case searchSettingLanguageViewId
    
    public func getStoryBoardIDEnumDetail() -> (name: String, className: String, isNavigationBar: Bool, isBottomTabBar: Bool, isAnimated: Bool) {
        switch self {
        case .none:
            return (name: "", className: "UIViewControllerBase", isNavigationBar: false, isBottomTabBar: false, isAnimated: false)
        case .calendarViewId:
            return (name: "CalendarView", className: "CalendarViewController", isNavigationBar: true, isBottomTabBar: true, isAnimated: false)
        case .calendarListViewId:
            return (name: "CalendarListView", className: "CalendarListViewController", isNavigationBar: true, isBottomTabBar: false, isAnimated: true)
            
        case .searchViewId:
            return (name: "SearchView", className: "SearchViewController", isNavigationBar: true, isBottomTabBar: true, isAnimated: false)
        case .searchSettingViewId:
            return (name: "SearchSettingView", className: "SearchSettingViewController", isNavigationBar: true, isBottomTabBar: true, isAnimated: false)
        case .searchSettingLanguageViewId:
            return (name: "SearchSettingLanguageView", className: "SearchSettingLanguageViewController", isNavigationBar:true, isBottomTabBar: false, isAnimated: false)
        }
    }
    
    public static func findByEnumRawvalue(className: String) -> StoryBoardIDEnum? {
        StoryBoardIDEnum.allCases.first(where: {$0.getStoryBoardIDEnumDetail().className == className})
    }
}
