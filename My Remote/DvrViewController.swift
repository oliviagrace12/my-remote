//
//  DvrViewController.swift
//  My Remote
//
//  Created by Olivia Chisman on 2/19/22.
//

import UIKit

class DvrViewController: UIViewController {

    @IBOutlet weak var power: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var controllerView: UIView!
    @IBOutlet weak var displayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func powerToggled(_ sender: UISwitch) {
        if sender.isOn {
            power.text = "On"
            controllerView.isUserInteractionEnabled = true
            displayView.backgroundColor = UIColor.systemGray5
        } else {
            power.text = "Off"
            controllerView.isUserInteractionEnabled = false
            displayView.backgroundColor = UIColor.black
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
