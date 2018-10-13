//
//  ViewController.swift
//  Flashcards
//
//  Created by Matthew Ross on 10/12/18.
//  Copyright © 2018 Matthew Ross. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ansLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        
        questionLabel.isHidden = true;
        
    }
    
    

}

