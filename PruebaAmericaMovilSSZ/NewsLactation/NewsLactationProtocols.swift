//
//  NewsLactationProtocols.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//  
//

import Foundation
import UIKit

protocol NewsLactationViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: NewsLactationPresenterProtocol? { get set }
    func uiCustomization()
    func configureTable()
    func showDataArticles(news: [Article])
    
}

protocol NewsLactationWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createNewsLactationModule() -> UIViewController
}

protocol NewsLactationPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: NewsLactationViewProtocol? { get set }
    var interactor: NewsLactationInteractorProtocol? { get set }
    var wireFrame: NewsLactationWireFrameProtocol? { get set }
    func viewDidLoad()
    func bringNews(news: [Article])
    func dataNews()
}

protocol NewsLactationInteractorProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    var presenter: NewsLactationPresenterProtocol? {get set}
    func getNews()
}
