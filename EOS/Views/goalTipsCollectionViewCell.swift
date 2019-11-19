//
//  goalTipsCollectionViewCell.swift
//  EOS
//
//  Created by Patrick Holmes on 10/10/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class goalTipsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var goalTipsImageView: UIImageView!
        
    
    @IBOutlet weak var goalTipsLabel: UILabel!
    
    var goalTip: goalTip! {
            didSet {
                updateUI()
            }
        }
        
        func updateUI() {
            goalTipsImageView.image = UIImage(named: goalTip.authorImage)
            goalTipsLabel.text = goalTip.tip
    //        blogAuthorLabel.text = blog.author
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

//    override var bounds: CGRect {
//        didSet {
//          contentView.frame = bounds
//        }
//    }
//    
}
