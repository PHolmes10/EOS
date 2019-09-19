//
//  ShopViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/5/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class ShopViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colors = ShopColors()
        
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        
    }
    
}

