//
//  HomeLactationWireFrame.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation
import UIKit

class HomeLactationWireFrame: HomeLactationWireFrameProtocol {

    class func createHomeLactationModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? HomeLactationView {
            let presenter = HomeLactationPresenter()
            let interactor = HomeLactationInteractor()

            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeLactationView", bundle: Bundle.main)
    }
    
}
