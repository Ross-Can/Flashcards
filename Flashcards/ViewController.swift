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
    var ans: String?
    
    override func viewDidLoad() {
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.02
        card.clipsToBounds = true
        questionLabel.clipsToBounds = true
        ansLabel.clipsToBounds = true
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
    
    func checkIfAns(btn: UIButton){
        if(btn.titleLabel?.text == ans )
        {
        questionLabel.isHidden = !questionLabel.isHidden;
        }
        else
        {
        btn.isHidden = true;
        }
        
    }
    
    
    

}

