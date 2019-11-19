//
//  PrivacyView.swift
//  EOS
//
//  Created by Patrick Holmes on 11/19/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class PrivacyView: UIView {
    
    @IBAction func handleBack(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBOutlet weak var privacyTextView: UITextView!
    
}
