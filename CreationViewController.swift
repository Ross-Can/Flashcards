//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Matthew Ross on 10/24/18.
//  Copyright © 2018 Matthew Ross. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {
  
    var flashcardsController: ViewController!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
    dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text
        let answerText =  answerTextField.text
        
        if(answerText == nil && questionText == nil || answerText!.isEmpty && questionText!.isEmpty)
        {showError(issue: "Text fields Empty", alert: "Please fill in BOTH text fields")}
            
        else if(answerText == nil || answerText!.isEmpty)
        {  showError(issue: "Text field Empty", alert: "Please fill in the ANSWER text field. Then press done." )}
            
        else if(questionText == nil || questionText!.isEmpty)
        {  showError(issue: "Text field Empty", alert: "Please fill in the QUESTION text field. Then press done." )}
            
        else
        {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
            
            flashcardsController.reset()
            dismiss(animated: true)
        }
    }
    
    func showError(issue:String!, alert: String!){
         let okAction = UIAlertAction(title: "Ok I'll Try again" , style: .default)
         let alert = UIAlertController (title: issue, message: alert, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
   
    

}
