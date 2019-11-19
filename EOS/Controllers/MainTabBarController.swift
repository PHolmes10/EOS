//
//  MainTabBarController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let layerGradient = CAGradientLayer()
//    var circle: UIView?
//    var wasOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPlayerDetailsView()
        
        //tabBarItem Circle Effect
//        let numberOfItems = CGFloat(5)
//        let tabBarItemSize = CGSize(width: (tabBar.frame.width / numberOfItems) - 20, height: tabBar.frame.height)
//        circle = UIView(frame: CGRect(x: 0, y: 0, width: (tabBarItemSize.height)+20, height: (tabBarItemSize.height)+20))
//        circle?.backgroundColor = UIColor(red: 60.0 / 255.0, green: 78.0 / 255.0, blue: 91.0 / 255.0, alpha: 1.0)
//        circle?.layer.cornerRadius = circle!.frame.width/2
//        circle?.alpha = 0
//        tabBar.addSubview(circle!)
//        tabBar.sendSubviewToBack(circle!)

        delegate = self
        
        let blogController =  UINavigationController(rootViewController: BlogViewController())
        blogController.tabBarItem.title = "Blog"
        blogController.tabBarItem.image = #imageLiteral(resourceName: "blog")
        blogController.tabBarItem.imageInsets = UIEdgeInsets(top: 1, left: 0, bottom: -1, right: 0)
        
        let podcastController = UINavigationController(rootViewController: PodcastViewController())
        podcastController.tabBarItem.title = "Podcast"
        podcastController.tabBarItem.image = #imageLiteral(resourceName: "podcast")
        podcastController.tabBarItem.imageInsets = UIEdgeInsets(top: 1, left: 0, bottom: -1, right: 0)
        
        // Use the following code to wrap in navigation controller for navbar title etc.
        let meditationController = UINavigationController(rootViewController: MeditationViewController())
//        let meditationController =  MeditationViewController()
        meditationController.tabBarItem.title = "Meditations"
        meditationController.tabBarItem.image = #imageLiteral(resourceName: "meditation")
        meditationController.tabBarItem.imageInsets = UIEdgeInsets(top: 1, left: 0, bottom: -1, right: 0)
        
        
        // Using storyboard for goal controller
        let storyboard = UIStoryboard(name: "GoalsSB", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GoalsSB")
//        self.navigationController?.pushViewController(controller, animated: true)
        
        let goalSetterController = UINavigationController(rootViewController: controller)
        goalSetterController.tabBarItem.title = "Goals"
        goalSetterController.tabBarItem.image = #imageLiteral(resourceName: "goalSetter")
        goalSetterController.tabBarItem.imageInsets = UIEdgeInsets(top: 1, left: 0, bottom: -1, right: 0)
        
        let shopController = UINavigationController(rootViewController: ShopViewController())
        shopController.tabBarItem.title = "More"
        shopController.tabBarItem.image = #imageLiteral(resourceName: "More")
        shopController.tabBarItem.imageInsets = UIEdgeInsets(top: 1, left: 0, bottom: -1, right: 0)
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 1)
        
        viewControllers = [
            blogController,
            podcastController,
            goalSetterController,
            meditationController,
            shopController
        ]
        
        layerGradient.colors = [UIColor(red: 4.0 / 255.0, green: 7.0 / 255.0, blue: 16.0 / 255.0, alpha: 1.0).cgColor, UIColor(red: 16.0 / 255.0, green: 43.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0).cgColor]
        layerGradient.startPoint = CGPoint(x: 0, y: 0)
        layerGradient.endPoint = CGPoint(x: 0, y: 0.1)
        layerGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        self.tabBar.layer.insertSublayer(layerGradient, at:0)
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
        // tabBarItem Circle Effect
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let index = -(tabBar.items?.firstIndex(of: tabBar.selectedItem!)?.distance(to: 0))!
//        let frame = frameForTabAtIndex(index: index)
//        circle?.center.x = frame.origin.x + frame.width/2
//        circle?.center.y = (frame.origin.y)-2 + frame.height
//        circle?.alpha = 1
//    }
    
    func frameForTabAtIndex(index: Int) -> CGRect {
        var frames = tabBar.subviews.compactMap { (view:UIView) -> CGRect? in
            if let view = view as? UIControl {
                for item in view.subviews {
                    if let image = item as? UIImageView {
                        return image.superview!.convert(image.frame, to: tabBar)
                    }
                }
                return view.frame
            }
            return nil
        }
        frames.sort { $0.origin.x < $1.origin.x }
        if frames.count > index {
            return frames[index]
        }
        return frames.last ?? CGRect.zero
    }

    //Mark- Podcast Section Functions etc
    @objc func minimizePlayerDetails() {
        maximizedTopAnchorConstraint.isActive = false
        bottomAnchorConstraint.constant = view.frame.height
        minimizedTopAnchorConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.tabBar.transform = .identity
            self.playerDetailsView.maximizedStackView.alpha = 0
            self.playerDetailsView.miniPlayerView.alpha = 1
        })
        
    }
    
    func maximizePlayerDetails(episode: Episode?, playlistEpisodes: [Episode] = []) {
        minimizedTopAnchorConstraint.isActive = false
        maximizedTopAnchorConstraint.isActive = true
        maximizedTopAnchorConstraint.constant = 0
        bottomAnchorConstraint.constant = 0
        
        if episode != nil {
            playerDetailsView.episode = episode
        }
        
        playerDetailsView.playlistEpisodes = playlistEpisodes
        
        let frame = self.tabBar.frame
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
//            self.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            self.tabBar.frame = frame.offsetBy(dx: 0, dy: 100)
            
            self.playerDetailsView.maximizedStackView.alpha = 1
            self.playerDetailsView.miniPlayerView.alpha = 0
        })
    }
    
    //MARK:- Setup Functions
    
    let playerDetailsView = PlayerDetailsView.initFromNib()
    var maximizedTopAnchorConstraint: NSLayoutConstraint!
    var minimizedTopAnchorConstraint: NSLayoutConstraint!
    var bottomAnchorConstraint: NSLayoutConstraint!
    
    fileprivate func setupPlayerDetailsView() {
        view.insertSubview(playerDetailsView, belowSubview: tabBar)
        playerDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        maximizedTopAnchorConstraint = playerDetailsView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height)
        maximizedTopAnchorConstraint.isActive = true
        bottomAnchorConstraint = playerDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height)
        bottomAnchorConstraint.isActive = true
        minimizedTopAnchorConstraint = playerDetailsView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
        
        playerDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        playerDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}


//Mark- Original code - no podcast functions etc
extension MainTabBarController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let index = self.tabBar.items?.firstIndex(of: item)
        let subView = tabBar.subviews[index!+1].subviews.first as! UIImageView
        self.performSpringAnimation(imgView: subView)
        
        // TabBarItems Circle Effect
//        let index1 = -(tabBar.items?.firstIndex(of: item)?.distance(to: 0))!
//        let frame = frameForTabAtIndex(index: index1)
//        self.circle?.center.x = frame.origin.x + frame.width/2
    }
    
    func performSpringAnimation(imgView: UIImageView) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            
            imgView.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            
            //reducing the size
            UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                imgView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { (flag) in
            }
        }) { (flag) in
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard
            let tabViewControllers = tabBarController.viewControllers,
            let targetIndex = tabViewControllers.firstIndex(of: viewController),
            let targetView = tabViewControllers[targetIndex].view,
            let currentViewController = selectedViewController,
            let currentIndex = tabViewControllers.firstIndex(of: currentViewController)
            else { return false }
        
        if currentIndex != targetIndex {
            animateToView(targetView, at: targetIndex, from: currentViewController.view, at: currentIndex)
        }
        
        return true
    }
    
}

private extension MainTabBarController {
    
    func animateToView(_ toView: UIView, at toIndex: Int, from fromView: UIView, at fromIndex: Int) {
        // Position toView off screen (to the left/right of fromView)
        let screenWidth = UIScreen.main.bounds.size.width
        let offset = toIndex > fromIndex ? screenWidth : -screenWidth
        
        toView.frame.origin = CGPoint(
            x: toView.frame.origin.x + offset,
            y: toView.frame.origin.y
        )
        
        fromView.superview?.addSubview(toView)
        
        // Disable interaction during animation
        view.isUserInteractionEnabled = false
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 0.75,
            initialSpringVelocity: 0.5,
            options: .curveEaseInOut,
            animations: {
                // Slide the views by -offset
                fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
                toView.center = CGPoint(x: toView.center.x - offset, y: toView.center.y)
        },
            completion: { _ in
                // Remove the old view from the tabbar view.
                fromView.removeFromSuperview()
                self.selectedIndex = toIndex
                self.view.isUserInteractionEnabled = true
        }
        )
    }
    
}
