//
//  UIApplication+TopViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 11/15/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        switch (base) {
        case let controller as UINavigationController:
            return topViewController(controller.visibleViewController)
        case let controller as UITabBarController:
            return controller.selectedViewController.flatMap { topViewController($0) } ?? base
        default:
            return base?.presentedViewController.flatMap { topViewController($0) } ?? base
        }
    }
}
