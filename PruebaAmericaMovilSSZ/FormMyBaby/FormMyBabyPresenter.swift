//
//  FormMyBabyPresenter.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation

class FormMyBabyPresenter  {
    
    // MARK: Properties
    weak var view: FormMyBabyViewProtocol?
    var interactor: FormMyBabyInteractorProtocol?
    var wireFrame: FormMyBabyWireFrameProtocol?
    
}

extension FormMyBabyPresenter: FormMyBabyPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.uiCustomization()
    }
    func buttonGirl() {
        view?.chooseGirl()
    }
    func buttonBoy() {
        view?.chooseBoy()
    }
    func cleanInfo() {
        view?.cleanButtonInfo()
    }
    func saveDataBaby() {
        view?.saveInfoBaby()
    }
    func editAvatarbaby() {
        view?.chooseAvatar()
    }
}

