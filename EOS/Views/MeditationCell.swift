//
//  MeditationCell.swift
//  EOS
//
//  Created by Patrick Holmes on 9/10/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class MeditationCell: UITableViewCell {
    
    @IBOutlet weak var meditationCellImageView: UIImageView!
    
    @IBOutlet weak var meditationTitleLabel: UILabel!
    
    @IBOutlet weak var meditationAuthorLabel: UILabel!
    
    var meditation: Meditation! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        meditationCellImageView.image = UIImage(named: meditation.meditationImage)
        meditationTitleLabel.text = meditation.title
        meditationAuthorLabel.text = meditation.author
    }
}
