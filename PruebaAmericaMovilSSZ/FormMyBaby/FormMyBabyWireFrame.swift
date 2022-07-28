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

    static func createFormMyBaby() -> UIViewController {
        let viewController = FormMyBabyWireFrame.mainStoryboard.instantiateViewController(withIdentifier: "FormMyBabyView")
        if let view = viewController as? FormMyBabyView {
            let presenter: FormMyBabyPresenterProtocol = FormMyBabyPresenter()
            let interactor: FormMyBabyInteractorProtocol = FormMyBabyInteractor()
            let wireFrame: FormMyBabyWireFrameProtocol = FormMyBabyWireFrame()
            
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
        return UIStoryboard(name: "FormMyBabyView", bundle: Bundle.main)
    }
    
}
