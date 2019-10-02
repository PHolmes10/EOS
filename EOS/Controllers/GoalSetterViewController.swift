//
//  GoalSetterViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalSetterViewController: UIViewController {
    
    let setGoalButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(#imageLiteral(resourceName: "Pier"), for: .normal)
        button.layoutIfNeeded()
        button.subviews.first?.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(setGoalButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let goalListButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(#imageLiteral(resourceName: "Book"), for: .normal)
        button.layoutIfNeeded()
        button.subviews.first?.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(goalsListButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "mountainBackground"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Goals"

        view.addSubview(backgroundImage)
        view.addSubview(setGoalButton)
        view.addSubview(goalListButton)
        
//        let GoalSetterMainView = Bundle.main.loadNibNamed("GoalSetterMainView", owner: self, options: nil)?.first as! GoalSetterMainView
//
//        self.view = GoalSetterMainView
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        // Background Image
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        // Set a new goal button
        setGoalButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        setGoalButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        setGoalButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        setGoalButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        // Set a new goal button
        goalListButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        goalListButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        goalListButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        goalListButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    @objc func goalsListButtonClicked() {
        print("goals list Button Clicked")
        let gtvc = GoalsTableViewController()

        self.navigationController?.pushViewController(gtvc, animated: true)
    }
    
    @objc func setGoalButtonClicked() {
        print("set goal Button Clicked")
        let gtvc = GoalsTableViewController()

        self.navigationController?.pushViewController(gtvc, animated: true)
    }
    
}
