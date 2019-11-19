//
//  Colors.swift
//  EOS
//
//  Created by Patrick Holmes on 9/5/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class BlogColors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 22.0 / 255.0, green: 42.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 77.0 / 255.0, green: 160.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

class PodcastColors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 37.0 / 255.0, green: 163.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 12.0 / 255.0, green: 51.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

class GoalSetterColors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 143.0 / 255.0, green: 113.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 57.0 / 255.0, green: 43.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

class MeditationColors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 97.0 / 255.0, green: 174.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 25.0 / 255.0, green: 47.0 / 255.0, blue: 47.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

class ShopColors {
    var gl:CAGradientLayer!
    
    init() {
        let colorTop = UIColor(red: 46.0 / 255.0, green: 98.0 / 255.0, blue: 180.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 22.0 / 255.0, green: 42.0 / 255.0, blue: 72.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorTop, colorBottom]
        self.gl.locations = [0.0, 1.0]
    }
}

