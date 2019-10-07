//
//  GoalDetailView.swift
//  EOS
//
//  Created by Patrick Holmes on 10/1/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalDetailView: UIView {
    
    var goal: Goals! {
        didSet {
            goalTitleLabel.text = goal.goalTitle
            goalDescriptionView.text = goal.goalDescription
            goalDeadlineLabel.text = goal.goalDeadline
        }
    }
    
    @IBOutlet weak var goalImageView: UIImageView!
    
    @IBOutlet weak var goalTitleLabel: UILabel!
    
    @IBOutlet weak var goalDeadlineLabel: UILabel!
    
    @IBOutlet weak var goalDescriptionView: UITextView!
    
    @IBAction func handleBack(_ sender: Any) {
        
        self.removeFromSuperview()
    }
}
