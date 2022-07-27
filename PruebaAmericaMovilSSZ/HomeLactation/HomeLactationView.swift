//
//  HomeLactationView.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation
import UIKit

class HomeLactationView: UIViewController {

    // MARK: Properties
    var presenter: HomeLactationPresenterProtocol?
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeLactationView: HomeLactationViewProtocol {
    // TODO: implement view output methods
}
