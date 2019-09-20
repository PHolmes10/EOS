//
//  BlogDetailView.swift
//  EOS
//
//  Created by Patrick Holmes on 9/19/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class BlogDetailView: UIView {
    
    var blog: Blog! {
        didSet {
            blogTitleLabel.text = blog.title
            blogAuthorLabel.text = blog.author
            blogImageView.image = UIImage(named: blog.blogImage)
        }
    }
    
    @IBAction func handleBack(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBOutlet weak var blogImageView: UIImageView!
    
    @IBOutlet weak var blogTitleLabel: UILabel!
    
    @IBOutlet weak var blogAuthorLabel: UILabel!
    
}
