//
//  ViewController.swift
//  My Remote
//
//  Created by Olivia Chisman on 1/30/22.
//

import UIKit

var channelConfigs: Array<ChannelConfig> = [ChannelConfig(label: "ABC", channel: 5),
                                            ChannelConfig(label: "NBC", channel: 6),
                                            ChannelConfig(label: "CBS", channel: 7),
                                            ChannelConfig(label: "FOX", channel: 8)]

class ViewController: UIViewController {

    @IBOutlet weak var power: UILabel!
    
    @IBOutlet weak var volume: UILabel!
    
    @IBOutlet weak var channel: UILabel!
    
    @IBOutlet weak var controlsView: UIView!
    
    @IBOutlet weak var displayView: UIView!
    
    var currentChannelText: String = "10"
    
    @IBOutlet weak var favoriteChannels: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        for i in 0...3 {
            favoriteChannels.setTitle(channelConfigs[i].label, forSegmentAt: i)
        }
    }

    @IBAction func powerToggled(_ sender: UISwitch) {
        if sender.isOn {
            power.text = "On"
            controlsView.isUserInteractionEnabled = true
            displayView.backgroundColor = UIColor.systemGray5
        } else {
            power.text = "Off"
            controlsView.isUserInteractionEnabled = false
            displayView.backgroundColor = UIColor.black
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
        let index = sender.selectedSegmentIndex
        let channelValue = channelConfigs[index].channel
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedValue = formatter.string(from: NSNumber(value: channelValue))!
        
        channel.text = channelValue < 10 ? "0\(formattedValue)" : "\(formattedValue)"
    }
}

