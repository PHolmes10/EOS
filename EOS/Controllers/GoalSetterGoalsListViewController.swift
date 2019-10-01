//
//  GoalSetterGoalsListViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/30/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class GoalSetterGoalsListViewController: UITableViewController {
    
    var blogs: [Blog] = Blog.fetchBlogs()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    fileprivate func setUpTableView() {
        
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        let nib = UINib(nibName: "BlogCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = .none
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        self.tableView.contentInset = insets
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BlogCell
        
        cell.backgroundColor = UIColor.clear
        let blog = blogs[indexPath.row]
        cell.blog = blog
        
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
        let blog = blogs[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        let window = UIApplication.shared.keyWindow
        let blogDetailView = Bundle.main.loadNibNamed("BlogDetailView", owner: self, options: nil)?.first as! BlogDetailView
        
        blogDetailView.blog = blog
        
        blogDetailView.frame = self.view.frame
        let colors = BlogColors()
        let backgroundLayer = colors.gl
        backgroundLayer?.frame = self.view.frame
        blogDetailView.layer.insertSublayer(backgroundLayer!, at: 0)
        window?.addSubview(blogDetailView)
        
    }
}
