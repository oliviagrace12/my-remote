//
//  ViewController.swift
//  My Remote
//
//  Created by Olivia Chisman on 1/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var power: UILabel!
    
    @IBOutlet weak var volume: UILabel!
    
    @IBOutlet weak var channel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func powerIsOff() -> Bool {
        return power.text != "On"
    }

    @IBAction func powerToggled(_ sender: UISwitch) {
        if sender.isOn {
            power.text = "On"
        } else {
            power.text = "Off"
        }
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        if (powerIsOff()) {
            return
        }
        
        let currentVol = round(sender.value * 100)
        let formattedVol = String(format: "%.0f", currentVol)
        volume.text = "\(formattedVol)"
    }
    
    @IBAction func channelEntered(_ sender: UIButton) {
        if (powerIsOff()) {
            return
        }
        
        if let value = sender.currentTitle {
            let currentValue = channel.text != nil ? channel.text! : ""
            
            if (currentValue.count < 2) {
                channel.text = "\(currentValue)\(value)"
            } else {
                channel.text = "\(value)"
            }
        }
    }
    
    @IBAction func channelUp(_ sender: UIButton) {
        if (powerIsOff()) {
            return
        }
        let currentText = channel.text != nil ? channel.text! : "1"
        if (currentText.count > 2) {
            return
        }
        
        let currentValue = Int(channel.text != nil ? channel.text! : "1")!
        if (currentValue < 99) {
            channel.text = "\(currentValue + 1)"
        }
    }
    
    @IBAction func channelDown(_ sender: UIButton) {
        if (powerIsOff()) {
            return
        }
        let currentText = channel.text != nil ? channel.text! : "1"
        if (currentText.count > 2) {
            return
        }
        
        let currentValue = Int(channel.text != nil ? channel.text! : "1")!
        if (currentValue > 1) {
            channel.text = "\(currentValue - 1)"
        }
    }
    
    @IBAction func favoriteChannelSelected(_ sender: UISegmentedControl) {
        if (powerIsOff()) {
            return
        }
        
        if let value = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            channel.text = "\(value)"
        }
    }
}

