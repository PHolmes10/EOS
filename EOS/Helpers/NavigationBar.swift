//
//  NavigationBar.swift
//  EOS
//
//  Created by Patrick Holmes on 10/3/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func installBlurEffect() {
        
        isTranslucent = true
        setBackgroundImage(UIImage(), for: .default)
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        var blurFrame = bounds
        blurFrame.size.height += statusBarHeight
        blurFrame.origin.y -= statusBarHeight
        let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.isUserInteractionEnabled = false
        blurView.frame = blurFrame
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurView)
        blurView.layer.zPosition = -1
        
    }
}
