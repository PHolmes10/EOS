//
//  NewGoalViewController.swift
//  EOS
//
//  Created by Patrick Holmes on 10/3/19.
//  Copyright © 2019 Patrick Holmes. All rights reserved.
//

import UIKit

class NewGoalViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var goalTitleTextField: UITextField!
    
    
    
    @IBOutlet weak var goalDescriptionTextView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dismissOutside(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveGoal(_ sender: Any) {
        
        var new: Goals?
        
        if let goal = editGoals {
            new = goal
        } else {
            new = Goals(context: context)
        }
        new?.goalTitle = goalTitleTextField.text
        new?.goalDescription = goalDescriptionTextView.text
        new?.goalDeadline = formattedDate
        
        do {
            ad.saveContext()
            self.dismiss(animated: true, completion: nil)
        } catch {
            print("cannot save")
        }
        
    }
    
    
    let placeholderColor = UIColor(red: 163.0 / 255.0, green: 140.0 / 255.0, blue: 137.0 / 255.0, alpha: 1.0)
    
    var editGoals: Goals?
    
    var formattedDate: String {
        get {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: datePicker.date)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalDescriptionTextView.text = "Be as specific as possible when describing your goal"
        goalDescriptionTextView.textColor = placeholderColor
        goalDescriptionTextView.delegate = self
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.minimumDate = Date()
        
        if let goal = editGoals {
            
            goalTitleTextField.text = goal.goalTitle
            goalDescriptionTextView.text = goal.goalDescription
            
        }
        
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

