//
//  goalTips.swift
//  EOS
//
//  Created by Patrick Holmes on 11/19/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import Foundation

struct goalTip {
    let tip: String
    let authorImage: String
    
    static func fetchGoalTips() -> [goalTip] {
        
        let g1 = goalTip(tip: "The difference between a desire and a goal is specificity. For example, being “more fulfilled” by your job is a desire but you still need a specific goal to strive for that will convert that desire into reality.\n-Steve Jones", authorImage: "Jones")
        let g2 = goalTip(tip: "The other key distinguisher between a desire and a goal is that a goal has a deadline. This gives you a sense of urgency to make sure that the goal gets achieved within a timely fashion and keeps it as a priority in your life until it gets achieved.\n-Steve Jones", authorImage: "Jones")
        let g3 = goalTip(tip: "If you don't set goals, you get used by those who have goals.\n\n-Jack Canfield", authorImage: "Canfield_Circle")
        let g4 = goalTip(tip: "What do you want to have, do, or be next? Then choose it. Consciously, intentionally declare that's where you want to go.\n-Joe Vitale", authorImage: "Vitale_Circle")
        let g5 = goalTip(tip: "You need to decide what you want. It might take a while for you to get there but you need to be laser focused on what you want.\n-Sonia Ricotti", authorImage: "Rocotti_Circle")
        let g6 = goalTip(tip: "I set goals based on how they're going to make me feel.\n\n-Matthew Toman", authorImage: "Toman_Circle")
        
        return [g1, g2, g3, g4, g5, g6]
    }
}
