//
//  ViewController.swift
//  Flashcards
//
//  Created by Matthew Ross on 10/12/18.
//  Copyright © 2018 Matthew Ross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    var ans: String?
    
    override func viewDidLoad() {
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        setBtn(btn: btnOptionOne)
        setBtn(btn: btnOptionTwo)
        setBtn(btn: btnOptionThree)
        setBtn(btn: btnAdd)
        
        setLabel(label: questionLabel)
        setLabel(label: ansLabel)
       
        ans = ansLabel.text
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
      checkIfAns(btn: btnOptionOne)
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
      checkIfAns(btn: btnOptionTwo)
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
       checkIfAns(btn: btnOptionThree)
    }
    
    func updateFlashcard(question:String, answer:String) {
        ansLabel.text = answer
        questionLabel.text = question
        ans = answer
    }
    
    func checkIfAns(btn: UIButton){
        if(btn.titleLabel?.text == ans )
        {
        questionLabel.isHidden = !questionLabel.isHidden;
        btn.layer.backgroundColor = #colorLiteral(red: 0.3586850655, green: 0.9811771373, blue: 0.5302384982, alpha: 1)
        }
        else
        {
        btn.isHidden = true;
        }
        
    }
    
    func setBtn(btn: UIButton){
          btn.layer.cornerRadius = 20.0
          btn.layer.borderWidth = 3.0
          btn.layer.shadowOpacity = 0.2
          btn.layer.shadowRadius = 2.0
          btn.layer.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
          btn.layer.borderColor = #colorLiteral(red: 0.9682895541, green: 1, blue: 0.8618559837, alpha: 1)
        
    }
    
    func setLabel(label: UILabel){
        label.clipsToBounds = true
        label.layer.cornerRadius = 20.0
    }
    
    func reset(){
        btnOptionOne.isHidden = false
        btnOptionTwo.isHidden = false
        btnOptionThree.isHidden = false
        questionLabel.isHidden = false
        
        setBtn(btn: btnOptionOne)
        setBtn(btn: btnOptionTwo)
        setBtn(btn: btnOptionThree)
        setBtn(btn: btnAdd)
        
        setLabel(label: questionLabel)
        setLabel(label: ansLabel)
        
        ans = ansLabel.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  navigationController = segue.destination as!UINavigationController
        let creationController = navigationController.topViewController as! CreationViewController
        creationController.flashcardsController = self
        creationController.questionTextField.text = questionLabel.text
        creationController.answerTextField.text = ansLabel.text
    }
    
    
    

}

