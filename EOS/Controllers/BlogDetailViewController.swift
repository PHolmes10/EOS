//
//  BlogDetailViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 9/11/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class BlogDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 95.0 / 255.0, green: 125.0 / 255.0, blue: 145.0 / 255.0, alpha: 1.0)
        
        // Blog Image View
        let imageName = "City"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 70, width: view.frame.width, height: view.frame.height/4)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25.0;
        imageView.layer.masksToBounds = true;
        view.addSubview(imageView)
        
        // Blog Title Label
        let blogTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        blogTitle.text = "This is the Blog Title"
        blogTitle.center = CGPoint(x: 220, y: 230)
        blogTitle.font = UIFont.preferredFont(forTextStyle: .title2)
        blogTitle.font = UIFont.boldSystemFont(ofSize: 23)
        blogTitle.textColor = .white
        blogTitle.backgroundColor = .clear
        self.view.addSubview(blogTitle)
        
        // Blog Author Label
        let blogAuthor = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
        blogAuthor.text = "Matthew Toman"
        blogAuthor.center = CGPoint(x: 220, y: 255)
        blogAuthor.font = UIFont.preferredFont(forTextStyle: .title3)
        blogAuthor.font = UIFont.boldSystemFont(ofSize: 18)
        blogAuthor.textColor = .white
        blogAuthor.backgroundColor = .clear
        self.view.addSubview(blogAuthor)
        
        // Blog Body Text View
        let blogBody = UITextView(frame: CGRect(x: 0, y: 0, width: 400, height: 500))
        blogBody.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        blogBody.isEditable = false
        blogBody.center = CGPoint(x: 210, y: 550)
        blogBody.textAlignment = .left
        blogBody.font = UIFont.preferredFont(forTextStyle: .body)
        blogBody.textColor = .white
        blogBody.backgroundColor = .clear
        self.view.addSubview(blogBody)
    }
}
