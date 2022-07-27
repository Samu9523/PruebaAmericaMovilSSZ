//
//  HomeLactationProtocols.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation
import UIKit

protocol HomeLactationViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomeLactationPresenterProtocol? { get set }
}

protocol HomeLactationWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeLactationModule() -> UIViewController
}

protocol HomeLactationPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeLactationViewProtocol? { get set }
    var interactor: HomeLactationInteractorProtocol? { get set }
    var wireFrame: HomeLactationWireFrameProtocol? { get set }
    
    func viewDidLoad()
}


protocol HomeLactationInteractorProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeLactationInteractorProtocol? { get set }
}

