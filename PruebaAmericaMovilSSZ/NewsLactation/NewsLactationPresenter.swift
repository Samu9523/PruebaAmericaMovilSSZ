//
//  NewsLactationPresenter.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//  
//

import Foundation

class NewsLactationPresenter  {
    
    // MARK: Properties
    weak var view: NewsLactationViewProtocol?
    var interactor: NewsLactationInteractorProtocol?
    var wireFrame: NewsLactationWireFrameProtocol?
    
}

extension NewsLactationPresenter: NewsLactationPresenterProtocol {
        
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.getNews()
        view?.configureTable()
    }
    func bringNews(news: [Article]) {
        view?.showDataArticles(news: news)
    }

}
