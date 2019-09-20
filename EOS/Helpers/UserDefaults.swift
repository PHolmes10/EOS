//
//  UserDefaults.swift
//  EOS
//
//  Created by Patrick Holmes on 9/18/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import Foundation

extension UserDefaults {
  
  static let downloadedEpisodesKey = "downloadedEpisodesKey"
  
  func deleteEpisode(episode: Episode) {
    let savedEpisodes = downloadedEpisodes()
    let filteredEpisodes = savedEpisodes.filter { (e) -> Bool in
      // TODO: use episode.collectionId to be safer with deletes
      return e.title != episode.title
    }
    
    do {
      let data = try JSONEncoder().encode(filteredEpisodes)
      UserDefaults.standard.set(data, forKey: UserDefaults.downloadedEpisodesKey)
    } catch let encodeErr {
      print("Failed to encode episode:", encodeErr)
    }
  }
  
  func downloadEpisode(episode: Episode) {
    do {
      var episodes = downloadedEpisodes()
      episodes.insert(episode, at: 0)
      let data = try JSONEncoder().encode(episodes)
      UserDefaults.standard.set(data, forKey: UserDefaults.downloadedEpisodesKey)
      
    } catch let encodeErr {
      print("Failed to encode episode:", encodeErr)
    }
  }
  
  func downloadedEpisodes() -> [Episode] {
    guard let episodesData = data(forKey: UserDefaults.downloadedEpisodesKey) else { return [] }
    
    do {
      let episodes = try JSONDecoder().decode([Episode].self, from: episodesData)
      return episodes
    } catch let decodeErr {
      print("Failed to decode:", decodeErr)
    }
    
    return []
  }
  
}


