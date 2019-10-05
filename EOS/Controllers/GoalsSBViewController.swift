//
//  testViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 10/2/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalsSBViewController: UIViewController {
    
    @IBAction func myGoalsButton(_ sender: Any) {
        
        let gtvc = GoalsTableViewController()
        self.navigationController?.pushViewController(gtvc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.installBlurEffect()
        self.title = "Goals"
        
    }
}
