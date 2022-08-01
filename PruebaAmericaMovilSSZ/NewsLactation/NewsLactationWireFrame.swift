//
//  NewsLactationWireFrame.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 29/07/22.
//  
//

import Foundation
import UIKit

class NewsLactationWireFrame: NewsLactationWireFrameProtocol {
    
    class func createNewsLactationModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "NewsLactationView")
        if let view = viewController as? NewsLactationView {
            let presenter: NewsLactationPresenterProtocol = NewsLactationPresenter()
            let interactor: NewsLactationInteractorProtocol = NewsLactationInteractor()
            let wireFrame: NewsLactationWireFrameProtocol = NewsLactationWireFrame()
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "NewsLactationView", bundle: Bundle.main)
    }
    
}
