//
//  FourthViewController.swift
//  appsolution
//
//  Created by mahyar on 20/03/2018.
//  Copyright © 2018 Appsolution. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var imageViewTeamTop: UIImageView!
    @IBOutlet weak var imageViewTeamOne: UIImageView!
    @IBOutlet weak var textViewTeamOne: UITextView!
    @IBOutlet weak var imageViewTeamTwo: UIImageView!
    @IBOutlet weak var textViewTeamTwo: UITextView!
    @IBOutlet weak var imageViewTeamThree: UIImageView!
    @IBOutlet weak var textViewTeamThree: UITextView!
    
    let urlImageTeamTop = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/team.JPG?alt=media&token=27c2dea5-bc95-425d-866e-f346c3b0787f")
    let urlImageTeamOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Janne.JPG?alt=media&token=6b2e52ab-0b61-43ff-b717-705973d0b2f7")
    let urlTextTeamOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Team2.txt?alt=media&token=f9a3e5df-7fa0-41d4-92ad-76f20ae393ca")
    let urlImageTeamTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/harri_new.jpeg?alt=media&token=c381ffb4-0dfb-4298-a8b4-541a99e38306")
    let urlTextTeamTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Team3.txt?alt=media&token=59bca252-ae97-467e-a610-1d2dbab87e9c")
    let urlImageTeamThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/mahyar.JPG?alt=media&token=7f4ac56e-ee3a-4bd0-abf8-006675032486")
    let urlTextTeamThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Team4.txt?alt=media&token=9e5b6fca-9e94-482a-adf5-3675efdebf1a")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        get_image(url: urlImageTeamTop!, imageView: imageViewTeamTop)
        get_image(url: urlImageTeamOne!, imageView: imageViewTeamOne)
        get_text(url: urlTextTeamOne!, textView: textViewTeamOne)
        get_image(url: urlImageTeamTwo!, imageView: imageViewTeamTwo)
        get_text(url: urlTextTeamTwo!, textView: textViewTeamTwo)
        get_image(url: urlImageTeamThree!, imageView: imageViewTeamThree)
        get_text(url: urlTextTeamThree!, textView: textViewTeamThree)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func get_text(url: URL, textView: UITextView) {
        
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if data != nil
            {
                //print(data: data!)
                if let textFile = String(data:data!, encoding: .utf8) {
                    print(textFile)
                    //self.textViewHomeOne.text = textFile
                    //}
                    //                if(textFile != nil)
                    //                {
                    DispatchQueue.main.async(execute: {
                        textView.text = textFile
                    })
                }
            }
        })
        task.resume()
    }
    
    func get_image(url: URL, imageView: UIImageView) {
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if data != nil
            {
                let image = UIImage(data: data!)
                if(image != nil)
                {
                    DispatchQueue.main.async(execute: {
                        imageView.image = image
                    })
                }
            }
        })
        task.resume()
        }
    }

