//
//  SecondView.swift
//  Culminating
//
//  Created by Hanna Dodd on 2017-05-30.
//  Copyright © 2017 Hanna Dodd. All rights reserved.
//

import UIKit
import GameplayKit

class SecondView: UIViewController {
    
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    
    @IBOutlet var gameMode: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timerLabel: UILabel!
    
    @IBOutlet var homeButton: UIButton!
    
    let ranColour = GKRandomDistribution(lowestValue:0, highestValue:1)     //random colour variables
    var colour:Int?
    
    var score:Int = 0                                                       //score variables
    
    var seconds:Int = 11
    var timer = Timer()                                                     //timer variables
    var isTimerRunning = false
    
    /* timer (all timer functions are from HERE) */
    
    //initializes the timer, sets the time interval to 1, selects which function to call upon
    //automatically calls itself to repeat
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(SecondView.updateTimer)), userInfo: nil, repeats: true)
        
    }
    
    //updates the timer and changes the label to display the updated time
    @objc func updateTimer() {
        
        if seconds > 0 {
            
            seconds -= 1                                        //if the time left is greater than 0, repeat
            timerLabel.text = "Time: \(seconds)"
            
        }
        else if seconds == 0 {
            
            resetGame()
            
        }
        
    }
    
    /* to HERE */
    
    
    //resets everything in the game to prepare to start again
    func resetGame() {
        
        timer.invalidate()
        isTimerRunning = false                                  //timer is stopped, seconds are reset
        seconds = 11
        
        restartButton.isHidden = false
        tapLeft.isEnabled = false                               //reset button is shown and tap gestures are disabled
        tapRight.isEnabled = false
        
        scoreLabel.text = "FINAL SCORE: \(score)"               //final score is shown to the user, timer is hidden
        timerLabel.text = ""
        
    }
    
    //the game begins again
    func playAgain() {
        
        score = 0
        scoreLabel.text = ""                                    //score is reset
        
        tapLeft.isEnabled = true
        tapRight.isEnabled = true                               //tap gestures are re-enabled and the restart button is hidden
        restartButton.isHidden = true
        
        runTimer()                                              //timer is started again
    }
    
    //assigns red or blue based on whether the random int is 0 or 1
    //passes an image view to determine which view the colour is being assigned to
    func RedOrBlue(view1: UIImageView, view2: UIImageView) {
        
        colour = ranColour.nextInt()
        
        if colour == 0 {
            
            view1.image = UIImage(named: "image0")               //if the  random int is 0, first image is red
            view2.image = UIImage(named: "image1")
            
        }
        else if colour == 1 {
            
            view1.image = UIImage(named: "image1")               //if the random int is 1, first image is blue
            view2.image = UIImage(named: "image0")
            
        }
        
    }
    
    //determines whether the user tapped the correct colour
    //passes the imageview that is tapped to determine which image to evaluate
    func RightOrWrong(view1: UIImageView) {
        
        if view1.image == UIImage(named: "image0") {
            
            RedOrBlue(view1:imageView1, view2:imageView2)        //if the tapped image is red, re-assign colour values
            
            score += 1
            scoreLabel.text = String(score)
            
        }
        else {
            
            resetGame()                                         //if the image is blue, reset the game
            
        }
        
    }
    
    @IBOutlet var tapLeft: UITapGestureRecognizer!
    @IBAction func leftViewTap(_ sender: Any) {
        
        RightOrWrong(view1:imageView1)                          //any tap is evaluated to be right or wrong, while enabled
        
    }
    
    @IBOutlet var tapRight: UITapGestureRecognizer!
    @IBAction func rightViewTap(_ sender: Any) {
        
        RightOrWrong(view1:imageView2)                          //any tap is evaluated to be right or wrong, while enabled
        
    }
    
    @IBOutlet var restartButton: UIButton!
    @IBAction func restartButton(_ sender: Any) {
        
        playAgain()                                             //start game over again
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameMode.text = "PRESS THE RED TILE"
        scoreLabel.text = ""                            //sets up the UI
        timerLabel.text = ""
        restartButton.isHidden = true
        
        runTimer()                                      //starts timer
        print(highScoresEasy)
        
        RedOrBlue(view1:imageView1, view2:imageView2)   //chooses a random image
        
        homeButton.layer.cornerRadius = 6               //rounds the corners of home and restart buttons
        restartButton.layer.cornerRadius = 6
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
