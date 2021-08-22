//
//  UIViewControllerBase.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/12.
//

import UIKit
import Foundation

class UIViewControllerBase: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let storyBoardIdEnum = getStoryBoardIdEnum() {
            if storyBoardIdEnum.getStoryBoardIDEnumDetail().isBottomTabBar {
                // ボトムタブ作成
                self.createBottomTabBar()
            }
        }
        
    }
    //画面遷移
    open func transitionStoryBoard(sbEnum: StoryBoardIDEnum) {
        let sb = sbEnum.getStoryBoardIDEnumDetail()
        //次の画面取得
        let storyboard: UIStoryboard = UIStoryboard(name: sb.name, bundle: nil)
        let nextView = storyboard.instantiateInitialViewController()
        nextView?.modalPresentationStyle = .fullScreen
        // 遷移
        self.present(nextView!, animated: sb.isAnimated, completion: nil)
    }
    
    
    // バックグラウンド復帰
    override open func viewWillAppear(_ animated: Bool) {
        
    }
    
    // バックグラウンド待機
    override open func viewDidDisappear(_ animated: Bool) {
        
    }
    
    // 戻るボタンタップ
    open func tapBackBtn() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // クラス名からStoryBoardId取得
    private func getStoryBoardIdEnum() -> StoryBoardIDEnum? {
        if let topController = UIApplication.topViewController()  {
            return StoryBoardIDEnum.findByEnumRawvalue(className: topController.className)
        }
        return StoryBoardIDEnum.none
    }
}

extension UIViewControllerBase: UITabBarDelegate {
    
    // ボトムタブ作成
    open func createBottomTabBar() {
        
        let tabBar = UITabBar()
        //デリゲートを設定する
        tabBar.delegate = self
        //ボタンを生成
        let tab1: UITabBarItem =
            UITabBarItem.init(title: StringEnum.tab1_title.rawValue, image: UIImage(systemName: StringEnum.tab1_image.rawValue), tag: 1)
        let tab2: UITabBarItem =
            UITabBarItem.init(title: StringEnum.tab2_title.rawValue, image: UIImage(systemName: StringEnum.tab2_image.rawValue), tag: 2)
        // 後で修正
        let tab3: UITabBarItem =
            UITabBarItem.init(title: StringEnum.tab3_title.rawValue, image: UIImage(systemName: StringEnum.tab2_image.rawValue), tag: 3)
        let tab4: UITabBarItem =
            UITabBarItem.init(title: StringEnum.tab4_title.rawValue, image: UIImage(systemName: StringEnum.tab2_image.rawValue), tag: 4)
        
        //ボタンをタブバーに配置する
        tabBar.items = [tab1, tab2, tab3, tab4]
        
        // tabの位置指定
        tabBar.frame =
            CGRect(x:0, y: UIScreen.main.bounds.size.height - 50, width: UIScreen.main.bounds.size.width, height: 50)
        
        tabBar.barTintColor = .clear
        tabBar.isTranslucent = false
        //ボタンを押した時の色
        tabBar.tintColor = UIColor.red
        //選択されていないボタンの色
        tabBar.unselectedItemTintColor = UIColor.white
        
        self.view.addSubview(tabBar)
    }
    
    open func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.searchViewId)
        case 2:
            self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.calendarViewId)
        case 3:
            self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.calendarViewId)
        case 4:
            self.transitionStoryBoard(sbEnum: StoryBoardIDEnum.calendarViewId)
        default: return
        }
    }
    
}
