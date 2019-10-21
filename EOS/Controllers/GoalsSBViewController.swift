//
//  testViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 10/2/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class GoalsSBViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var newGoalButton: UIButton!
    
    @IBOutlet weak var myGoalsBtn: UIButton!
    
    @IBOutlet weak var newGoalBlur: UIVisualEffectView!
    
    @IBOutlet weak var goalListBlur: UIVisualEffectView!
    
    @IBOutlet weak var goalTipsCollectionView: UICollectionView!
    
    
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
        
        goalTipsCollectionView.register(UINib.init(nibName: "goalTipsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "goalTipsIdentifier")
        
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: goalTipsCollectionView.frame.size.height - 120)
        layout.sideItemScale = 0.6
        layout.sideItemAlpha = 0.4
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 150)
        goalTipsCollectionView.collectionViewLayout = layout
        goalTipsCollectionView.delegate = self
        goalTipsCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width + 30, height: view.frame.height/2.3)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = goalTipsCollectionView.dequeueReusableCell(withReuseIdentifier: "goalTipsIdentifier", for: indexPath) as! goalTipsCollectionViewCell
        
        cell.goalTipsLabel.text = "The difference between a desire and a goal is specificity. For example, being “more fulfilled” by your job is a desire but you still need a specific goal to strive for that will convert that desire into reality."
        
        return cell
    }
}
