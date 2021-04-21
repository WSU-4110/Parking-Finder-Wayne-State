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
    
    func runTimer()
    {
        timer = Timer.scheduleTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer()
    {
        seconds -= 1
        timerLabel.text = timeString(time: TimeIntervel(seconds))
    }
    @IBAction func pauseButtonTapped(_ sender: UIButton)
    {
        if self.resumeTapped == false
        {
            timer.invaliddata()
            self.resumeTapped = false
        }
        else
        {
            runTimer()
            self.resumeTapped = false
        }
        @IBACtion func resetButtonTapped(_ sender: UIButton)
        {
            timer.invaliddata()
            seconds = 60
            timerLabel.text = timeString(time : TimeIntervel(seconds))
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
                timerLabel.text = timeString(time: TimeInterval(seconds))
            }
        }
        func timeSTring(time:TimeInterval) -> String
        {
            let hours = Int(time) / 3600
            let minute = Int(time) / 60 % 60
            let seconds = Int(time) % 60
            return String (format:"%02i:%02i:%02i", hours, minutes, seconds)
        }
        override func viewDidLoad()
        {
            super.viewDidLoad()
        }
    }
}
