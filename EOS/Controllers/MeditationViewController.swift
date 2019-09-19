//
//  MeditationViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class MeditationViewController: UITableViewController {
    
    var meditations: [Meditation] = Meditation.fetchMeditations()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let colors = MeditationColors()
//        
//        view.backgroundColor = UIColor.clear
//        let backgroundLayer = colors.gl
//        backgroundLayer?.frame = view.frame
//        view.layer.insertSublayer(backgroundLayer!, at: 0)
        
        let tempImageView = UIImageView(image: UIImage(named: "gradientImage"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
        
        // Registering Cell for tableview
        
        setUpTableView()
        
    }
    
    fileprivate func setUpTableView() {
        
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        let nib = UINib(nibName: "MeditationCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        self.tableView.separatorStyle = .none
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meditations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MeditationCell
        
        cell.backgroundColor = UIColor.clear
        let meditation = meditations[indexPath.row]
        cell.meditation = meditation
        //        let blog = self.blogs[indexPath.row]
        //        cell.textLabel?.text = "\(blog.title)\n\(blog.author)"
        //        cell.textLabel?.numberOfLines = -1
        //        cell.textLabel?.textColor = .red
        //        cell.imageView?.image = #imageLiteral(resourceName: "testCellImage")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // MARK:- UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        let meditationPlayerViewController = MeditationPlayerViewController()
        self.navigationController?.pushViewController(meditationPlayerViewController, animated: true)
    }
        
}
    

