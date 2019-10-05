//
//  GoalSetterViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//
import Foundation
import UIKit

class GoalSetterViewController: UIViewController {
    
    let setGoalButton: UIButton = {
        let button = UIButton(type: .custom)
        
        // blur effect not working (cannot bring background image subview to front, need to find workaround)
//        let blur = UIVisualEffectView(effect: UIBlurEffect(style:
//            UIBlurEffect.Style.light))
//        blur.frame = button.bounds
//        blur.isUserInteractionEnabled = false //This allows touches to forward to the button.
//        button.insertSubview(blur, at:0)
//        button.bringSubviewToFront(button.imageView!)

        button.setBackgroundImage(#imageLiteral(resourceName: "Pier"), for: .normal)
        button.setTitle("Set a New Goal", for: .normal)
//        button.titleLabel?.backgroundColor = UIColor.red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.contentEdgeInsets = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)
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
        button.setTitle("My Goals", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.contentEdgeInsets = UIEdgeInsets(top: 150, left: 0, bottom: 0, right: 0)
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
        
        setupLayout()
        
//        let GoalSetterMainView = Bundle.main.loadNibNamed("GoalSetterMainView", owner: self, options: nil)?.first as! GoalSetterMainView
//        self.view = GoalSetterMainView
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
//        let gtvc = GoalsTableViewController()
//
//        self.navigationController?.pushViewController(gtvc, animated: true)
        
        // Showing Storyboard
        let storyboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "testViewController")
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
