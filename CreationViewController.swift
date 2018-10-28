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
    
    @IBOutlet weak var choiceOneTextfield: UITextField!
    @IBOutlet weak var choiceTwoTextfield: UITextField!
    @IBOutlet weak var choiceThreeTextfield: UITextField!
    
    var initialQuestion: String?
    var intitialAnswer: String?
    var intitialChoiceOne: String?
    var intitialChoiceTwo: String?
    var intitialChoiceThree: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextField.text = initialQuestion
        answerTextField.text = intitialAnswer
        choiceOneTextfield.text = intitialChoiceOne
        choiceTwoTextfield.text = intitialChoiceTwo
        choiceThreeTextfield.text = intitialChoiceThree

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
        let choiceOne =  choiceOneTextfield.text
        let choiceTwo =  choiceTwoTextfield.text
        let choiceThree =  choiceThreeTextfield.text
        
        if(answerText == nil && questionText == nil || answerText!.isEmpty && questionText!.isEmpty)
        {showError(issue: "Text fields Empty", alert: "Please fill in BOTH text fields")}
            
        else if(answerText == nil || answerText!.isEmpty)
        {  showError(issue: "Text field Empty", alert: "Please fill in the ANSWER text field. Then press done." )}
            
        else if(questionText == nil || questionText!.isEmpty)
        {  showError(issue: "Text field Empty", alert: "Please fill in the QUESTION text field. Then press done." )}
        
        else if(choiceMissing(answer: answerText))
        {showError(issue: "The correct answer is missing.", alert:"Please edit your multiple choice to include the answer.")}
        else
        {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!,choiceOne: choiceOne,choiceTwo:choiceTwo ,choiceThree:choiceThree)
            
            flashcardsController.reset()
            dismiss(animated: true)
        }
    }
    
    func choiceMissing(answer: String?) -> Bool {
        if(choiceOneTextfield.text == answer)
        { return false}
        else if(choiceTwoTextfield.text == answer)
        { return false}
        else if(choiceThreeTextfield.text == answer)
        { return false}
        else
        { return true}
    }
    
    func showError(issue:String!, alert: String!){
         let okAction = UIAlertAction(title: "Ok I'll Try again" , style: .default)
         let alert = UIAlertController (title: issue, message: alert, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
   
    

}
