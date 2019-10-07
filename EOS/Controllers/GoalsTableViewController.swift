//
//  GoalSetterGoalsListViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/30/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit
import CoreData

class GoalsTableViewController: UITableViewController {
    
//    var blogs: [Blog] = Blog.fetchBlogs()
    
    var goals = [Goals]()
    
    let cellId = "cellId"
    
    override func viewWillAppear(_ animated: Bool) {
        loadGoals()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 162.0 / 255.0, green: 128.0 / 255.0, blue: 118.0 / 255.0, alpha: 1.0)
//        let tempImageView = UIImageView(image: UIImage(named: "blueGradient"))
//        tempImageView.frame = self.tableView.frame
//        self.tableView.backgroundView = tempImageView
        
    
        setUpTableView()
    }
    
    func loadGoals() {
        let fetchRequest:NSFetchRequest<Goals> = Goals.fetchRequest()
        
        do {
            goals = try context.fetch(fetchRequest)
            self.tableView.reloadData()
        } catch {
            print("cannot fetch from database")
        }
    }
    
    fileprivate func setUpTableView() {
        
        let nib = UINib(nibName: "GoalCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = .none
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        self.tableView.contentInset = insets
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GoalCell
        
        cell.setGoal(goal: goals[indexPath.row])
        cell.backgroundColor = UIColor.clear
//        let blog = blogs[indexPath.row]
//        cell.blog = blog
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad){
            return 500
        }
        else {
            return 250
        }
    }
    
    // MARK:- UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goal = goals[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        let window = UIApplication.shared.keyWindow
        let goalDetailView = Bundle.main.loadNibNamed("GoalDetailView", owner: self, options: nil)?.first as! GoalDetailView
        
        goalDetailView.goal = goal
        
        goalDetailView.frame = self.view.frame
        let colors = BlogColors()
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = self.view.frame
        goalDetailView.layer.insertSublayer(backgroundLayer!, at: 0)
        window?.addSubview(goalDetailView)
        
    }
}
