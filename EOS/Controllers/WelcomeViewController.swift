//
//  WelcomeViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 10/20/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var beginButton: UIButton!
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        nameTextField.delegate = self
//        beginButton.isHidden = true

        navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    @IBAction func toMTBC(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        
        let mainTabBarVC = MainTabBarController()
        self.navigationController?.pushViewController(mainTabBarVC, animated: true)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (nameTextField.text?.isEmpty != nil){
            beginButton.isHidden = true
        }else{
            beginButton.isHidden = false
        }
    }
}
