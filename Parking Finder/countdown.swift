//
//  countdown.swift
//  Parking Finder
//
//  Created by Salem Baraka on 4/21/21.
//code to create a ui timer, need to be conencted to database working on it

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

class countDown: UIViewController
{
    @IBOutlet weak var timeLabel: UILabel!
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    @IBAction func startButtonTapped(_ sender: UIButton)
    {
        runTimer()
    }
    
    func updateTimer()
    {
        seconds -= 1
    }
    @IBAction func pauseButtonTapped(_ sender: UIButton)
    {
        if self.resumeTapped == false
        {
            self.resumeTapped = false
        }
        else
        {
            runTimer()
            self.resumeTapped = false
        }
        @IBACtion func resetButtonTapped(_ sender: UIButton)
        {
            seconds = 60
            isTimerRunning = false
        }
        
        func updateTimer()
        {
            if seconds < 1 {
                timer.invalidate()
            }
            else
            {
                seconds -= 1
            }
        }
        func timeSTring(time:TimeInterval) -> String
        {
            let hours = Int(time) / 3600
            let minute = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String (format:"%02i:%02i:%02i", hours, minutes, seconds)
        }
    }
}
