//
//  ViewController.swift
//  Tapped
//
//  Created by Hanna Dodd on 2017-05-30.
//  Copyright © 2017 Hanna Dodd. All rights reserved.
//
//  Tapped
//      Tap the red tile as many times as you can in
//      the alloted time. If you tap the blue tile
//      you lose.
//


import UIKit

var highScoresEasy:[Int] = []                           //global array, used for storing scores

class ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "T A P P E D"                 //fancy title name
        
        startButton.layer.cornerRadius = 6              //rounds the corners of start and highscore buttons
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
