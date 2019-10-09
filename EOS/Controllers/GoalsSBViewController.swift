//
//  testViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 10/2/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalsSBViewController: UIViewController {
    
    @IBOutlet weak var newGoalButton: UIButton!
    
    @IBOutlet weak var myGoalsBtn: UIButton!
    
    @IBOutlet weak var newGoalBlur: UIVisualEffectView!
    
    @IBOutlet weak var goalListBlur: UIVisualEffectView!
    
    @IBAction func myGoalsButton(_ sender: Any) {
        
        let gtvc = GoalsTableViewController()
        self.navigationController?.pushViewController(gtvc, animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.installBlurEffect()
        self.title = "Goals"
        newGoalButton.imageView?.contentMode = .scaleAspectFill
        myGoalsBtn.imageView?.contentMode = .scaleAspectFill
        newGoalBlur.isUserInteractionEnabled = false
        goalListBlur.isUserInteractionEnabled = false
    }
}
