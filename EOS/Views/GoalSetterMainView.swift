//
//  GoalSetterMainView.swift
//  EOS
//
//  Created by Patrick Holmes on 9/30/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalSetterMainView: UIView {
    
    
    @IBAction func setANewGoalTouchUpInside(_ sender: Any) {
        print("setting new goal")
    }
    
    @IBAction func myGoalsTouchUpInside(_ sender: Any) {
        print("my goals")
        
//        self.removeFromSuperview()

        let gsglvc = GoalSetterGoalsListViewController()
        
        GoalSetterViewController().navigationController?.pushViewController(gsglvc, animated: true)

    }
    
    
}
