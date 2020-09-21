//
//  PostListTableViewCell.swift
//  post
//
//  Created by Stone web on 21/09/20.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userPost: UILabel!
    @IBOutlet weak var titlePost: UILabel!
    @IBOutlet weak var bodyPost: UILabel!

    func configurateRow(post: PostShow) {
    
        userPost.text = String(post.userId!)
        titlePost.text = post.title
        bodyPost.text = post.body
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    
    
}
