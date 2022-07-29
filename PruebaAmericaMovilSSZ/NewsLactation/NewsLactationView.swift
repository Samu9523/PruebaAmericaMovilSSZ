//
//  NewsLactationView.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//  
//

import Foundation
import UIKit

class NewsLactationView: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    // MARK: Properties
    var presenter: NewsLactationPresenterProtocol?
    var news: [Article]?
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension NewsLactationView: NewsLactationViewProtocol {
    func uiCustomization() {
        title = "Noticias"
    }
    
    func configureTable() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    func showDataArticles(news: [Article]) {
        DispatchQueue.main.async {
            self.news = news
            self.newsTableView.reloadData()
        }
    }
    
    // TODO: implement view output methods
}
extension NewsLactationView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
        
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let usercell = tableView.dequeueReusableCell(withIdentifier: NewsLactationTableViewCell.identifier, for: indexPath) as? NewsLactationTableViewCell else{
            return UITableViewCell()
        }
        return usercell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}
