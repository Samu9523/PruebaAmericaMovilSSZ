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

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var editAvatarImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthPickerImage: UIImageView!
    @IBOutlet weak var girlButton: UIButton!
    @IBOutlet weak var boyButton: UIButton!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    
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
