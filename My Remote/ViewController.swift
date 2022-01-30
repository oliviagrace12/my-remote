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
    
    @IBOutlet weak var controlsView: UIView!
    
    var currentChannelText: String = "10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func powerToggled(_ sender: UISwitch) {
        if sender.isOn {
            power.text = "On"
            controlsView.isUserInteractionEnabled = true
        } else {
            power.text = "Off"
            controlsView.isUserInteractionEnabled = false
        }
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        let currentVol = round(sender.value * 100)
        let formattedVol = String(format: "%.0f", currentVol)
        volume.text = "\(formattedVol)"
    }
    
    @IBAction func channelEntered(_ sender: UIButton) {
        if let value = sender.currentTitle {
            if (currentChannelText.count < 2) {
                currentChannelText = "\(currentChannelText)\(value)"
            } else {
                currentChannelText = "\(value)"
            }
            
            if (currentChannelText.count == 2) {
                channel.text = currentChannelText
            }
        }
    }
    
    @IBAction func channelUp(_ sender: UIButton) {
        let currentText = channel.text != nil ? channel.text! : "1"
        if (currentText.count > 2) {
            return
        }
        
        let currentValue = Int(channel.text != nil ? channel.text! : "1")!
        if (currentValue < 99) {
            let newValue = currentValue + 1
            let formattedValue = newValue < 10 ? "0\(newValue)" : "\(newValue)"
            currentChannelText = formattedValue
            channel.text = "\(formattedValue)"
        }
    }
    
    @IBAction func channelDown(_ sender: UIButton) {
        let currentText = channel.text != nil ? channel.text! : "1"
        if (currentText.count > 2) {
            return
        }
        
        let currentValue = Int(channel.text != nil ? channel.text! : "1")!
        if (currentValue > 1) {
            let newValue = currentValue - 1
            let formattedValue = newValue < 10 ? "0\(newValue)" : "\(newValue)"
            currentChannelText = formattedValue
            channel.text = "\(formattedValue)"
        }
    }
    
    @IBAction func favoriteChannelSelected(_ sender: UISegmentedControl) {
        if let value = sender.titleForSegment(at: sender.selectedSegmentIndex) {
            channel.text = "\(value)"
        }
    }
}

