//
//  NewsTableViewCell.swift
//  HackerNews
//
//  Created by Siran Li on 6/26/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureNewsCell(hit: Hit) {

        titleLabel.text = "title: \(hit.title)"
        authorLabel.text = "author: \(hit.author)"
        storyLabel.text = "story: \(hit.storyText ?? "")"
    }
}
