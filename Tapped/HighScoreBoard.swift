//
//  HighScoreBoard.swift
//  Culminating
//
//  Created by Hanna Dodd on 2017-06-15.
//  Copyright © 2017 Hanna Dodd. All rights reserved.
//
//  Scores
//      Highscores are placed on the scoreboard view
//      in order from highest to lowest. The player can
//      view their highscores for their current game
//      by transitioning to this view.
//      The scores are stored in a table view.
//

import UIKit

class HighScoreBoard: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var scoreArray:[Int] = highScoresEasy       //reassigns the score array, to be able to sort it
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreArray.sort {
            
            return $0 > $1                      //sorts the integers in the array from highest to lowest
            
        }
        print(scoreArray)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* TABLE VIEW SETUP */
    
    //decides how many sections in table view
    //passes UITableView in case you are working with more than one
    //returns an integer
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1            //one section in the table view
        
    }
    
    //decides how many rows per section in the view
    //passes UITableView, in case you are working with more than one, and an integer for how many sections there are
    //returns an integer
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return scoreArray.count   //the amount of rows is equal to the size of the array
        
    }
    
    //decides what data goes into the cells and reuses it as the table is scrolled through
    //passes UITableView, and IndexPath (the index of the row, as well as the section the row is in)
    //returns a UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = String(scoreArray[indexPath.row])
        return cell
        
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
