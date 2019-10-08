//
//  Blog.swift
//  EOS
//
//  Created by Patrick Holmes on 9/6/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import Foundation

struct Blog {
    let title: String
    let author: String
    let blogImage: String
    
    static func fetchBlogs() -> [Blog] {

        let b1 = Blog(title: "Taking the Risk Taking the Risk Taking the Risk Taking the Risk", author: "Daniel Holmes", blogImage: "Book")
        let b2 = Blog(title: "Other Blog", author: "Patrick Holmes", blogImage: "City")
        let b3 = Blog(title: "Third Blog", author: "Matthew Toman", blogImage: "Landscape")
        let b4 = Blog(title: "Fourth Blog", author: "Fourth Author",blogImage: "Light")
        let b5 = Blog(title: "Fifth Blog", author: "Fifth Author",blogImage: "Lotus")
        let b6 = Blog(title: "Sixth Blog", author: "Matthew Toman 6",blogImage: "Musician")
        let b7 = Blog(title: "Seventh Blog", author: "Matthew Toman 7",blogImage: "Pier")
        
        return [b1, b2, b3, b4, b5, b6, b7]
    }
}
