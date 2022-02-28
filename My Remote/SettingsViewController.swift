//
//  SettingsViewController.swift
//  My Remote
//
//  Created by Olivia Chisman on 2/27/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var index = 0
    var label = ""
    var channel: Double = 1

    @IBOutlet weak var channelDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonToggled(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
    }
    
    @IBAction func labelEntered(_ sender: UITextField) {
        if let text = sender.text {
            if (text.count < 1 || text.count > 4) {
                showErrorPopup(title: "Invalid Label", message: "Please enter a label between 1-4 characters")
            } else {
                label = text
            }
        }
    }
    
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        channel = sender.value
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        channelDisplay.text = formatter.string(from: NSNumber(value: channel))
    }
    
    @IBAction func saveConfig(_ sender: UIButton) {
        if (label.isEmpty) {
            showErrorPopup(title: "Invalid Label", message: "Please enter a label between 1-4 characters")
        } else {
            channelConfigs[index] = ChannelConfig(label: label, channel: channel)
        }
    }
    
    func showErrorPopup(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
