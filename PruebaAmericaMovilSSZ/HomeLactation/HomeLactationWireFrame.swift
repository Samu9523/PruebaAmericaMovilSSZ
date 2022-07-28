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
    

    static func createHomeLactationModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? HomeLactationView {
            let presenter = HomeLactationPresenter()
            let interactor = HomeLactationInteractor()
            let wireFrame = HomeLactationWireFrame()

            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "HomeLactationView", bundle: Bundle.main)
    }
    func presentFormView(from view: HomeLactationViewProtocol) {
        let nextView = FormMyBabyWireFrame.createFormMyBaby()
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(nextView, animated: true)
        }
    }
    
    
}
