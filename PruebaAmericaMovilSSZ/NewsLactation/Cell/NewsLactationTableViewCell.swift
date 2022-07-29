//
//  NewsLactationTableViewCell.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//

import UIKit

class NewsLactationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    
    static let identifier = "NewsLactationTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(news: Article){
        titleLabel.text = news.title
        descriptionLabel.text = news.articleDescription
        autorLabel.text = news.author
    }
    
}
