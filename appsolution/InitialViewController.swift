//
//  InitialViewController.swift
//  appsolution
//
//  Created by mahyar on 25/03/2018.
//  Copyright © 2018 Appsolution. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
            // Your code with delay
            self.performSegue(withIdentifier: "changeToMain", sender: nil)
        }

        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
