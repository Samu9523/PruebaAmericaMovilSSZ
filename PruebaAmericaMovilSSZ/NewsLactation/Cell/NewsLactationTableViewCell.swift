//
//  NewsLactationTableViewCell.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//

import UIKit

class NewsLactationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    @IBOutlet weak var urlLabel: UILabel!
    
    
    var titleNews: String?
    var contentNews: String?
    var urlNotice: String?
    static let identifier = "NewsLactationTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(news: Article){
        titleNews = news.title == nil ? "Sin Título" : news.title
        titleLabel?.text = titleNews
        contentNews = news.content == nil ? "Sin contenido" : news.content
        descriptionLabel?.text = contentNews
        urlNotice = news.url == nil ? "Sin url" : news.url
        urlLabel.text = urlNotice
    }
}
