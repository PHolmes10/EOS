//
//  RSSFeed.swift
//  EOS
//
//  Created by Patrick Holmes on 9/18/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import Foundation
import FeedKit

extension RSSFeed {
  
  func toEpisodes() -> [Episode] {
    let imageUrl = iTunes?.iTunesImage?.attributes?.href
    
    var episodes: [Episode] = []
    items?.forEach({ (feedItem) in
      var episode = Episode(feedItem: feedItem)
      
      if episode.imageUrl == nil {
        episode.imageUrl = imageUrl
      }
      
      episodes.append(episode)
    })
    return episodes
  }
  
}
