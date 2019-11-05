//
//  MeditationViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class MeditationViewController: UITableViewController {
    
//    var meditations: [Meditation] = Meditation.fetchMeditations()
    
    
    // Podcast replica variables
    var podcasts: [Podcast] = []
    var episodes: [Episode] = []
    
    var podcast: Podcast?
    {
        didSet {
            fetchEpisodes()
        }
    }
    
    let cellId = "cellId"
    
    var term = "evolution of success"

    override func viewDidLoad() {
        super.viewDidLoad()

          // Possible navBar options if they want to show title on top of page
//        self.navigationItem.title = "Meditations"
//        navigationController?.hidesBarsOnSwipe = true

        
          // Background color for page (buggy)
//        let colors = MeditationColors()
//        view.backgroundColor = UIColor.clear
//        let backgroundLayer = colors.gl
//        backgroundLayer?.frame = view.frame
//        view.layer.insertSublayer(backgroundLayer!, at: 0)
        navigationController?.navigationBar.installBlurEffect()
        self.title = "Meditations"
        
        let tempImageView = UIImageView(image: UIImage(named: "blueGradient"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
        
        // Podcast replica functions
        findPodcast()
        setupTableView()
        
    }
    
//    fileprivate func setUpTableView() {
//        
//        let nib = UINib(nibName: "MeditationCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: cellId)
//        self.tableView.separatorStyle = .none
//        
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return meditations.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MeditationCell
//        
//        cell.backgroundColor = UIColor.clear
//        let meditation = meditations[indexPath.row]
//        cell.meditation = meditation
//        
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//    
//    // MARK:- UITableViewDelegate
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let meditationPlayerViewController = MeditationPlayerViewController()
//        self.navigationController?.pushViewController(meditationPlayerViewController, animated: true)
//    }
    
    
//MARK- podcast replica for meditations functions
    func findPodcast() {
        podcasts = []
        tableView.reloadData()
        APIService.shared.fetchPodcasts(term: term) { podcasts in
            self.podcasts = podcasts
            self.findEpisodes()
            self.tableView.reloadData()
        }
        
    }
    
    func findEpisodes() {
        let episodesViewController = self
        episodesViewController.podcast = podcasts[0]
        //        navigationController?.pushViewController(episodesViewController, animated: true)
    }
    
    fileprivate func fetchEpisodes() {
        guard let feedUrl = podcast?.feedUrl else { return }
        APIService.shared.fetchEpisodes(feedUrl: feedUrl) { [weak self] (episodes) in
            guard let `self` = self else { return }
            self.episodes = episodes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK:- UITableView
    
    fileprivate func setupTableView() {
        tableView.register(EpisodeTableViewCell.nib, forCellReuseIdentifier: EpisodeTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
        self.tableView.contentInset = insets
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.reuseIdentifier, for: indexPath) as! EpisodeTableViewCell
        cell.episode = episodes[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = self.episodes[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController
        mainTabBarController?.maximizePlayerDetails(episode: episode, playlistEpisodes: self.episodes)
    }
    
    
    fileprivate func showBadgeHighlight() {
        UIApplication.mainTabBarController()?.viewControllers?[1].tabBarItem.badgeValue = "New"
    }
    
    //MARK:- Download functions
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.color = .white
        activityIndicatorView.center = self.view.center
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let downloadAction = UITableViewRowAction(style: .normal, title: "Download") { (_, _) in
            let episode = self.episodes[indexPath.row]
            UserDefaults.standard.downloadEpisode(episode: episode)
            APIService.shared.downloadEpisode(episode: episode)
        }
        return [downloadAction]
    }
    
    //MARK:- Variable height support
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad){
            return 500
        }
        else {
            return 250
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return episodes.isEmpty ? 200 : 0
    }
}
    

