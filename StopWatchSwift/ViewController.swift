//
//  ViewController.swift
//  StopWatchSwift
//
//  Created by Raj on 05/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var timer = Timer()
    var counter = 0.0
    var isRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        titleLabel.text = "\(counter)" // 0.0
        playbutton.isEnabled = true
        playbutton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnReset(_ sender: UIButton) {
        
        timer.invalidate()
        titleLabel.text = "\(counter)" // 0.0
        counter = 0
        playbutton.isEnabled = true
        pause.isEnabled = false
        isRunning = false
    }
    @IBAction func btnPlay(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playbutton.isEnabled = false
        pause.isEnabled = true
        isRunning = true
    }
    
    @objc func updateTimer() {
        counter += 0.1
        titleLabel.text = String(format: "%.1f", counter)
    }
    
    @IBAction func btnPause(_ sender: UIButton) {
        timer.invalidate()
        playbutton.isEnabled = true
        pause.isEnabled = false
        isRunning = false
    }
}

