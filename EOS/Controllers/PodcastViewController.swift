//
//  PodcastViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/4/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class PodcastViewController: UITableViewController {
    
    var podcasts: [Podcast] = []
    var episodes: [Episode] = []

    var podcast: Podcast?
    {
        didSet {
            //      navigationItem.title = "Mindset and Marketing Podcast"
            print("didSet")
            fetchEpisodes()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tempImageView = UIImageView(image: UIImage(named: "blueGradient"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView
//        let colors = PodcastColors()
//
//        view.backgroundColor = UIColor.clear
//        let backgroundLayer = colors.gl
//        backgroundLayer?.frame = view.frame
//        view.layer.insertSublayer(backgroundLayer!, at: 0)
        
        
        
        
        findPodcast()
        setupTableView()
    }
    
    func findPodcast() {
        podcasts = []
        tableView.reloadData()
        APIService.shared.fetchPodcasts(term: "this past weekend") { podcasts in
            self.podcasts = podcasts
            print(podcasts)
            self.findEpisodes()
            self.tableView.reloadData()
            print("findPodcastDone")
        }

    }

    func findEpisodes() {
        let episodesViewController = self
        episodesViewController.podcast = podcasts[0]
        //        navigationController?.pushViewController(episodesViewController, animated: true)
        print("findEpisodes")
    }

    fileprivate func fetchEpisodes() {
        guard let feedUrl = podcast?.feedUrl else { return }
        print("fetchEpisodes1")
        APIService.shared.fetchEpisodes(feedUrl: feedUrl) { [weak self] (episodes) in
            guard let `self` = self else { return }
            self.episodes = episodes
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print("fetchEpisodesMainThread")
            }
        }
    }

    //MARK:- UITableView

    fileprivate func setupTableView() {
        tableView.register(EpisodeTableViewCell.nib, forCellReuseIdentifier: EpisodeTableViewCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
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
        let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? MainTabBarController
        mainTabBarController?.maximizePlayerDetails(episode: episode, playlistEpisodes: self.episodes)
        print("this is episode", episode.title)
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
        return 250
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return episodes.isEmpty ? 200 : 0
    }

    
}
