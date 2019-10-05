//
//  NewGoalViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 10/3/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class NewGoalViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var goalDescriptionTextView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dismissOutside(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    let placeholderColor = UIColor(red: 163.0 / 255.0, green: 140.0 / 255.0, blue: 137.0 / 255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalDescriptionTextView.text = "Be as specific as possible when describing your goal"
        goalDescriptionTextView.textColor = placeholderColor
        goalDescriptionTextView.delegate = self
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.minimumDate = Date()
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == placeholderColor {
            textView.text = nil
            textView.textColor = UIColor.white
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Be as specific as possible when describing your goal"
            textView.textColor = placeholderColor
        }
    }
}

