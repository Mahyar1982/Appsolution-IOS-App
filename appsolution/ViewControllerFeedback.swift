//
//  ViewControllerFeedback.swift
//  appsolution
//
//  Created by mahyar on 02/04/2018.
//  Copyright © 2018 Appsolution. All rights reserved.
//

import UIKit
import MessageUI

class ViewControllerFeedback: UIViewController, MFMailComposeViewControllerDelegate {
    var stringPhone = "000"
    var stringMessage = "nothing"
    var stringDepartment = "nosection"
    
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var textFielMessage: UITextView!
    @IBOutlet weak var buttonAdmin: UIButton!
    @IBOutlet weak var buttonTechnic: UIButton!
    @IBOutlet weak var buttonR: UIButton!
    
    @IBAction func buttonAdministration(_ sender: UIButton) {
            stringDepartment = "janne@appsolution.fi"
        buttonAdmin.backgroundColor = .red
        buttonTechnic.backgroundColor = .gray
        buttonR.backgroundColor = .gray
        
    }
    @IBAction func buttonTechnical(_ sender: UIButton) {
        stringDepartment = "mahyar@appsolution.fi"
        buttonAdmin.backgroundColor = .gray
        buttonTechnic.backgroundColor = .red
        buttonR.backgroundColor = .gray
    }
    @IBAction func buttonRD(_ sender: UIButton) {
        stringDepartment = "harri@appsolution.fi"
        buttonAdmin.backgroundColor = .gray
        buttonTechnic.backgroundColor = .gray
        buttonR.backgroundColor = .red
    }

    @IBAction func buttonSendFeedback(_ sender: UIButton) {
        
        stringPhone = textFieldPhone.text!
        stringMessage = textFielMessage.text!
        if (stringPhone == "000" || stringMessage == "nothing" || stringDepartment == "nosection") {
            createAlert(titleText: "Error", messageText: "You dont select department or phone or message body is blank!")
        }
        else {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        else {
            showMailError()
        }
        }
    }
    
    func createAlert(titleText: String, messageText: String) {
        let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureMailController() -> MFMailComposeViewController {
        
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([stringDepartment])
        mailComposerVC.setSubject("Feedback or Request")
        mailComposerVC.setMessageBody("Phone: " + stringPhone + " , Message: " + stringMessage, isHTML: false)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Could not send mail", message: "Your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }


}
