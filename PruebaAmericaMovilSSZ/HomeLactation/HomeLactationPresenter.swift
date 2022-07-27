//
//  HomeLactationPresenter.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation

class HomeLactationPresenter  {
    
    // MARK: Properties
    weak var view: HomeLactationViewProtocol?
    var interactor: HomeLactationInteractorProtocol?
    var wireFrame: HomeLactationWireFrameProtocol?
    
}

extension HomeLactationPresenter: HomeLactationPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}