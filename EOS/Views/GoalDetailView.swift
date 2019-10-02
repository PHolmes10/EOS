//
//  GoalDetailView.swift
//  EOS
//
//  Created by Patrick Holmes on 10/1/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalDetailView: UIView {
    

    @IBOutlet weak var goalImageView: UIImageView!
    
    @IBOutlet weak var goalTitleLabel: UILabel!
    
    @IBOutlet weak var goalDeadlineLabel: UILabel!
    
    @IBOutlet weak var goalDescriptionView: UITextView!
    
    @IBAction func handleBack(_ sender: Any) {
        
        self.removeFromSuperview()
    }
}
