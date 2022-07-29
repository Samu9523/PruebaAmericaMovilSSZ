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
    
    //    let babyInfo = BabyInfoComplete(avatar: <#UIImageView#>, name: <#String#>, birth: <#String#>, gender: <#String#>)
    
    var genderSelection = ""
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var birthPickerImage: UIImageView!
    @IBOutlet weak var girlButton: UIButton!
    @IBOutlet weak var boyButton: UIButton!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editAvatarButton: UIButton!
    
    @IBAction func girlButtonAction(_ sender: Any) {
        presenter?.buttonGirl()
    }
    @IBAction func boyButtonAction(_ sender: Any) {
        presenter?.buttonBoy()
    }
    @IBAction func cleanButtonAction(_ sender: Any) {
        presenter?.cleanInfo()
    }
    @IBAction func saveButtonAction(_ sender: Any) {
    }
    @IBAction func editAvatarAction(_ sender: Any) {
        print("boton editar")
    }
    
    
    
    // MARK: Properties
    var presenter: FormMyBabyPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        /// Propiedad para ocultar el teclado
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
    }
    /// Funcion para ocultar el teclado despues de escribir en textfields
    @objc func tapGestureHandler(){
        nameTextField.endEditing(true)
        birthTextField.endEditing(true)
    }
}

extension FormMyBabyView: FormMyBabyViewProtocol {
    
    func uiCustomization() {
        title = "Agregar Bebé"
        avatarImage.layer.borderWidth = 5.0
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.size.width / 2
        avatarImage.clipsToBounds = true
    }
    func chooseGirl() {
        girlButton.configuration?.baseBackgroundColor = .systemOrange
        boyButton.configuration?.baseBackgroundColor = .white
        genderSelection = "Niña"
        print("Se cambió el genero a \(genderSelection)")
    }
    
    func chooseBoy() {
        boyButton.configuration?.baseBackgroundColor = .systemOrange
        girlButton.configuration?.baseBackgroundColor = .white
        genderSelection = "Niño"
        print("Se cambió el genero a \(genderSelection)")
    }
    func cleanButtonInfo() {
        avatarImage.image = UIImage(named: "BabyAvatar")
        nameTextField.text = ""
        birthTextField.text = ""
        genderSelection = ""
        girlButton.configuration?.baseBackgroundColor = .white
        boyButton.configuration?.baseBackgroundColor = .white
    }
    func saveInfoBaby() {
        <#code#>
    }
}
