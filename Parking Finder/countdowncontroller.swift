//
//  countdowncontroller.swift
//  Parking Finder
//
//  Created by Salem Baraka on 4/22/21.
//

import Foundation
import UIKit
class countdowncontroller: UIViewController{
    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    
    @IBAction func startButtonTapped(_ sender: UIButton){
        
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton){
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton)
    {
        
    }
    
}
