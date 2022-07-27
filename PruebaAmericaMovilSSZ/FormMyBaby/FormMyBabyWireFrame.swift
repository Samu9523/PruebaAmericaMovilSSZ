//
//  FormMyBabyWireFrame.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation
import UIKit

class FormMyBabyWireFrame: FormMyBabyWireFrameProtocol {

    class func createFormMyBabyModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "FormMyBabyView")
        if let view = navController.children.first as? FormMyBabyView {
            let presenter = FormMyBabyPresenter()
            let interactor = FormMyBabyInteractor()
            let wireFrame = FormMyBabyWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "FormMyBabyView", bundle: Bundle.main)
    }
    
}
