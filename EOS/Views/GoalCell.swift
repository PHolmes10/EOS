//
//  GoalCell.swift
//  EOS
//
//  Created by Patrick Holmes on 10/1/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var goalCellImageView: UIImageView!
    
    @IBOutlet weak var goalTitleLabel: UILabel!
   
    @IBOutlet weak var goalDeadlineLabel: UILabel!
    
    func setGoal(goal: Goals) {
        goalTitleLabel.text = goal.goalTitle
        goalDeadlineLabel.text = goal.goalDeadline
    }
    
    
}
