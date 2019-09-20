//
//  CMTime.swift
//  EOS
//
//  Created by Patrick Holmes on 9/18/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

//import AVKit
//
//extension CMTime {
//  
//  func toDisplayString() -> String {
//    guard !(CMTimeGetSeconds(self).isNaN || CMTimeGetSeconds(self).isInfinite) else { return "00:00:00" }
//    let totalSeconds = Int(CMTimeGetSeconds(self))
//    let seconds = totalSeconds % 60
//    let minutes = totalSeconds % (60 * 60) / 60
//    let hours = totalSeconds / 60 / 60
//    let timeFormatString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
//    return timeFormatString
//  }
//  
//}
