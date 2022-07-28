//
//  FormMyBabyProtocols.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation
import UIKit

protocol FormMyBabyViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: FormMyBabyPresenterProtocol? { get set }
}

protocol FormMyBabyWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createFormMyBaby() -> UIViewController
}

protocol FormMyBabyPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: FormMyBabyViewProtocol? { get set }
    var interactor: FormMyBabyInteractorProtocol? { get set }
    var wireFrame: FormMyBabyWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol FormMyBabyInteractorProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    var presenter: FormMyBabyPresenterProtocol? {get set}
}
