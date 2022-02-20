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
            state.text = "Stopped"
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

    @IBAction func play(_ sender: UIButton) {
        if (state.text == "Recording") {
            displayInvalidActionPopup(currentAction: state.text!, desiredAction: "Recording")
        } else {
            state.text = "Playing"
        }
    }
    
    @IBAction func pause(_ sender: UIButton) {
        if (state.text == "Playing") {
            state.text = "Paused"
        } else {
            displayInvalidActionPopup(currentAction: state.text!, desiredAction: "Paused")
        }
    }
    
    @IBAction func stop(_ sender: UIButton) {
        state.text = "Stopped"
    }
    
    @IBAction func rewind(_ sender: UIButton) {
        if (state.text == "Playing") {
            state.text = "Rewinding"
        } else {
            displayInvalidActionPopup(currentAction: state.text!, desiredAction: "Rewinding")
        }
    }
    
    @IBAction func fastForward(_ sender: UIButton) {
        if (state.text == "Playing") {
            state.text = "Fast Forwarding"
        } else {
            displayInvalidActionPopup(currentAction: state.text!, desiredAction: "Fast Forwarding")
        }
    }
    
    @IBAction func record(_ sender: UIButton) {
        if (state.text == "Stopped") {
            state.text = "Recording"
        } else {
            displayInvalidActionPopup(currentAction: state.text!, desiredAction: "Recording")
        }
    }
   
    func displayInvalidActionPopup(currentAction: String, desiredAction: String) {
        let title:String = "Cannot perform action \(desiredAction)"
        let message:String = "Would you like to force quit action \(currentAction) and start action \(desiredAction)?"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let proceedAction = UIAlertAction(
                title: "OK",
                style: .default,
                handler: {_ in self.displayConfirmedActionPopup(priorAction: currentAction, newAction: desiredAction)})
        
        alertController.addAction(cancelAction)
        alertController.addAction(proceedAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func displayConfirmedActionPopup(priorAction: String, newAction: String) {
        let title = "Action \(newAction) started"
        let message = "Action \(priorAction) has been stopped and action \(newAction) has been started"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: {() in self.state.text = newAction})
    }
}
