//
//  GoalSetterViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalSetterViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Goals"
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: "mountainBackground")
//        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
//
        let button: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .black
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
        
//        let GoalSetterMainView = Bundle.main.loadNibNamed("GoalSetterMainView", owner: self, options: nil)?.first as! GoalSetterMainView
//
//        self.view = GoalSetterMainView
        
        
        
    }
    
    @objc func buttonClicked() {
        print("Button Clicked")
        let gsglvc = GoalSetterGoalsListViewController()
        
        self.navigationController?.pushViewController(gsglvc, animated: true)
    }
    
}
