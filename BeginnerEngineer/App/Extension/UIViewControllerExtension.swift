//
//  UIViewControllerExtension.swift
//  BeginnerEngineer
//
//  Created by hosakaren on 2021/08/22.
//

import UIKit

extension UIViewController {
    var className: String {
        return String(describing: type(of: self))
    }
}
