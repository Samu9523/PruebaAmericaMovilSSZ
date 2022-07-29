//
//  FormMyBabyView.swift
//  PruebaAmericaMovilSSZ
//
//  Created by Samu Zav on 27/07/22.
//  
//

import Foundation
import UIKit

class FormMyBabyView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        presenter?.saveDataBaby()
    }
    @IBAction func editAvatarAction(_ sender: Any) {
        presenter?.editAvatarbaby()
    }
    
    // MARK: Properties
    var presenter: FormMyBabyPresenterProtocol?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var nameBaby: String?
    var birthBaby: String?
    var genderSelection: String?
    let imagePicker = UIImagePickerController()
    private var models = [BabyForm]()
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        getInfoSaved()
        loadDataView(babyForm: models.last ?? BabyForm())
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
        print("Se cambió el genero a \(genderSelection ?? "")")
    }
    
    func chooseBoy() {
        boyButton.configuration?.baseBackgroundColor = .systemOrange
        girlButton.configuration?.baseBackgroundColor = .white
        genderSelection = "Niño"
        print("Se cambió el genero a \(genderSelection ?? "")")
    }
    func cleanButtonInfo() {
        avatarImage.image = UIImage(named: "BabyAvatar")
        nameTextField.text = ""
        birthTextField.text = ""
        genderSelection = ""
        girlButton.configuration?.baseBackgroundColor = .white
        boyButton.configuration?.baseBackgroundColor = .white
        deleteItem(item: models.last ?? BabyForm())
    }
    func saveInfoBaby() {
        nameBaby = nameTextField.text ?? ""
        birthBaby = birthTextField.text ?? ""
        print("El nombre del bebé es \(nameBaby ?? "")")
        print("La fecha de nacimiento del bebé es \(birthBaby ?? "")")
        print("El bebé es \(genderSelection ?? "")")
        let newItem = BabyForm(context: context)
        newItem.name = nameBaby
        newItem.birth = birthBaby
        newItem.gender = genderSelection
        do{
            try context.save()
            print("‼️Se guardó correctamente la información.‼️")
        }
        catch{
            print("‼️No está funcionando el guardado de la información.‼️")
            newItem.birth = birthBaby
        }
    }
    
    func getInfoSaved() {
        do{
            models = try context.fetch(BabyForm.fetchRequest())
        }
        catch{
        }
    }
    ///
    func loadDataView(babyForm: BabyForm) {
        if (models.count > 0) {
        nameTextField.text = babyForm.name
        birthTextField.text = babyForm.birth
        if babyForm.gender == "Niña"{
            girlButton.configuration?.baseBackgroundColor = .systemOrange
            boyButton.configuration?.baseBackgroundColor = .white
        } else{
            girlButton.configuration?.baseBackgroundColor = .white
            boyButton.configuration?.baseBackgroundColor = .systemOrange
        }
        }else{
            print("❌No hay perfiles guardados❌")
        }
    }
    
    func deleteItem(item: BabyForm) {
        context.delete(item)
        do {
            try context.save()
            print("‼️Se borró la información guardada anteriormente‼️")
        }
        catch{
            print("‼️No se borró la información guardada‼️")
        }
    }
    
    func chooseAvatar() {
        let chooseAlert = UIAlertController(title: "Editar foto", message: "Selecciona", preferredStyle: UIAlertController.Style.alert)
        chooseAlert.addAction(UIAlertAction(title: "Album", style: .default, handler: { (action: UIAlertAction!) in
            self.albumButton()
        }))
        chooseAlert.addAction(UIAlertAction(title: "Cámara", style: .default, handler: { (action: UIAlertAction!) in
            self.cameraButton()
        }))
        present(chooseAlert, animated: true, completion: nil)
    }
    
    func cameraButton(){
        print("Seleccionaste cámara")
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func albumButton(){
        print("Seleccionaste album")
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        avatarImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
}
