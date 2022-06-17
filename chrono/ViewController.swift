//
//  ViewController.swift
//  chrono
//
//  Created by mac on 02/03/2022.
//

import UIKit

class ViewController: UIViewController {
     
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopButton.setTitleColor(UIColor.green, for: .normal)
    }

    @IBAction func resetAction(_ sender: UIButton) {
    
    let alert = UIAlertController(title: "reset timer?", message: "are you sure", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler:{ (_)in }))
        alert.addAction(UIAlertAction(title: "yes", style: .default, handler:{ (_)
            in
            self.count = 0
            self.timer.invalidate()
            self.TimerLabel.text = self.makeTimeString(hours: 0,minutes: 0,seconds: 0)
            self.startStopButton.setTitle("START", for: .normal)
            self.startStopButton.setTitleColor(UIColor.green, for: .normal)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func startAction(_ sender: UIButton) {
        if (timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startStopButton.setTitle("START", for: .normal)
            startStopButton.setTitleColor(UIColor.green, for: .normal)
            
        }
        else
        {
            timerCounting = true
            timer.invalidate()
            startStopButton.setTitle("STOP", for: .normal)
            startStopButton.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }}
    @objc func timerCounter() -> Void {
        count = count + 1
        let time = secondsToHourMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.text = timeString
    }
    func secondsToHourMinutesSeconds(seconds: Int) -> (Int,Int,Int)
    {
        return ((seconds / 3600),((seconds % 3600)/60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours : Int,minutes:Int,seconds:Int) -> String
    {
        var timeString = ""
        timeString += String(format:"%02d", hours)
        timeString += ":"
        timeString += String(format:"%02d", minutes)
        timeString += ":"
        timeString += String(format:"%02d", seconds)
        return timeString
    }
    
    
        
    
    
    
    
    
}

