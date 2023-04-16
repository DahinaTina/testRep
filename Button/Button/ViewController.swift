//
//  ViewController.swift
//  Button
//
//  Created by Tina on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
        @IBOutlet weak var timerLabel: UILabel!
    
    var isTimerWorked = false
    var count = 58.0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func startingLayout() {
        enableButtons(reset: false, pause: false, start: true)
               resetButton.layer.cornerRadius = resetButton.frame.height / 2
        pauseButton.layer.cornerRadius = pauseButton.frame.height / 2
        startButton.layer.cornerRadius = startButton.frame.height / 2
        timerLabel.layer.cornerRadius = 10
        
    }
    
    func resetButtonAction(_ sender: UIButton) {
        timer.invalidate()
        isTimerWorked = false
        count = 0.0
        timerLabel.text = "0:00:00.0"
        enableButtons(reset: false, pause: false, start: true)
    }
    
    func startButtonAction(_ sender: UIButton) {
        if !isTimerWorked {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
            enableButtons(reset: true, pause: true, start: false)
    }
}
    func pauseButtonAction(_ sender: UIButton) {
        
        isTimerWorked = false
        timer.invalidate()
    }
    
    @objc func updateTime() {
        count += 0.1
        let flooredCounter = Int(count)
        let hour = flooredCounter / 3600
        let minute = (flooredCounter % 3600) / 60
        let second = (flooredCounter % 3600 % 60)
        let minuteString = zeroAtTheBegining(in: minute)
        let secondString = zeroAtTheBegining(in: second)
        //decisecond
        let decisecond = String(format: "%.1f", count).components(separatedBy: ".").last!
        timerLabel.text = "\(hour):\(minuteString):\(secondString).\(decisecond)"
        
    }
 // MARK: вспомогательные функции
    
    func enableButtons(reset: Bool, pause: Bool, start: Bool) {
 }


func zeroAtTheBegining(in value: Int) -> String {
    value < 10 ? "0\(value)" : "\(value)"
}
}
