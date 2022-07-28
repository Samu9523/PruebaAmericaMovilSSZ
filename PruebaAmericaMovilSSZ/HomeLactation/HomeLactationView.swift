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

    @IBOutlet weak var lactationLogoImage: UIImageView!
    @IBOutlet weak var myBabyBUtton: UIButton!
    @IBOutlet weak var myBabyLabel: UILabel!
    @IBOutlet weak var howToLactateImage: UIImageView!
    @IBOutlet weak var howToLactateLabel: UILabel!
    @IBOutlet weak var problemsImage: UIImageView!
    @IBOutlet weak var problemsLabel: UILabel!
    @IBOutlet weak var suggestionsImage: UIImageView!
    @IBOutlet weak var suggestionsLabel: UILabel!
    
    @IBAction func myBabyButtonAction(_ sender: UIButton) {
        presenter?.showMyBabyForm()
    }
    
    // MARK: Properties
    var presenter: HomeLactationPresenterProtocol?
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    func clickOnMyBaby(){
    }
}

extension HomeLactationView: HomeLactationViewProtocol {
    // TODO: implement view output methods
}
