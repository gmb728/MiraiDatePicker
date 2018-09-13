//
//  ViewController.swift
//  MiraiDatePicker
//
//  Created by Chang Sophia on 2018/9/8.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit
import AVFoundation

var timer: Timer?
var goal: Date!
var now: Date!
var player: AVPlayer?

class ViewController: UIViewController {
    @IBOutlet weak var familyDatePicker: UIDatePicker!
    @IBOutlet weak var sceneImageView: UIImageView!
    @IBOutlet weak var goalTextField: UITextField!
    @IBOutlet weak var nowTextField: UITextField!
    @IBOutlet weak var intervalTextField: UITextField!
    
    override func viewDidDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
        }
    }
    
    @IBAction func familyDatePickerAction(_ sender: UIDatePicker) {
        goal = sender.date
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let time = formatter.string(from: now)
        self.nowTextField.text = time
        let interval = goal.timeIntervalSince(now)
        goalTextField.text = formatter.string(from: familyDatePicker.date)
        let integerinterval = Int(interval/60/60/24/365)
        intervalTextField.text = ("\(String(describing: integerinterval))")
        print(integerinterval)
        
      
        if integerinterval < -90{
            sceneImageView.image = UIImage(named: "grandpa")}
        else if integerinterval < -30 && integerinterval > -40{
        self.sceneImageView.image = UIImage(named: "mom")}
        else if integerinterval < 0 && integerinterval > -5{
            self.sceneImageView.image = UIImage(named: "dog")}
        else if integerinterval >= 0 && integerinterval < 1{
            self.sceneImageView.image = UIImage(named: "baby")}
        else if integerinterval == 17{
            self.sceneImageView.image = UIImage(named: "mirai")}
        else if integerinterval >= 21{
            self.sceneImageView.image = UIImage(named: "future")}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "mirai", withExtension: "mp4"){
            player = AVPlayer(url: url)
            player?.play()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

