//
//  Meditation.swift
//  EOS
//
//  Created by Patrick Holmes on 9/10/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import Foundation

struct Meditation {
    let title: String
    let author: String
    let meditationImage: String
    
    static func fetchMeditations() -> [Meditation] {
        
        let m1 = Meditation(title: "First Meditation", author: "Daniel Holmes", meditationImage: "Book")
        let m2 = Meditation(title: "Second Meditation", author: "Patrick Holmes", meditationImage: "City")
        let m3 = Meditation(title: "Third Meditation", author: "Matthew Toman", meditationImage: "Landscape")
        let m4 = Meditation(title: "Fourth Meditation", author: "Fourth Author",meditationImage: "Light")
        let m5 = Meditation(title: "Fifth Meditation", author: "Fifth Author",meditationImage: "Lotus")
        let m6 = Meditation(title: "Sixth Meditation", author: "Matthew Toman 6",meditationImage: "Musician")
        let m7 = Meditation(title: "Seventh Meditation", author: "Matthew Toman 7",meditationImage: "Pier")
        
        return [m1, m2, m3, m4, m5, m6, m7]
    }
}
