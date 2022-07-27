//
//  FormMyBabyView.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation
import UIKit

class FormMyBabyView: UIViewController {

    // MARK: Properties
    var presenter: FormMyBabyPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FormMyBabyView: FormMyBabyViewProtocol {
    // TODO: implement view output methods
}
