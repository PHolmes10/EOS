//
//  WelcomeViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 10/20/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    


    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)

        
    }
    
    @IBAction func toMTBC(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        
        let mainTabBarVC = MainTabBarController()
        self.navigationController?.pushViewController(mainTabBarVC, animated: true)
        
    }
    
    
}
