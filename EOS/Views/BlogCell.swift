//
//  BlogCell.swift
//  EOS
//
//  Created by Patrick Holmes on 9/10/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class BlogCell: UITableViewCell {

    @IBOutlet weak var blogCellImageView: UIImageView!
    
    @IBOutlet weak var blogTitleLabel: UILabel!
    
    @IBOutlet weak var blogAuthorLabel: UILabel!
    
    var blog: Blog! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        blogCellImageView.image = UIImage(named: blog.blogImage)
        blogTitleLabel.text = blog.title
        blogAuthorLabel.text = blog.author
    }
}
