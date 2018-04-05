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
    @IBOutlet weak var textViewOneEmail: UITextView!
    @IBOutlet weak var textViewOnePhone: UITextView!
    @IBOutlet weak var textViewTwoEmail: UITextView!
    @IBOutlet weak var textViewTwoPhone: UITextView!
    @IBOutlet weak var textViewThreeEmail: UITextView!
    @IBOutlet weak var textViewThreePhone: UITextView!
    
    let urlImageTeamTop = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/team.JPG?alt=media&token=27c2dea5-bc95-425d-866e-f346c3b0787f")
    let urlImageTeamOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Janne.JPG?alt=media&token=6b2e52ab-0b61-43ff-b717-705973d0b2f7")
    let urlTextTeamOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Team2.txt?alt=media&token=f9a3e5df-7fa0-41d4-92ad-76f20ae393ca")
    let urlImageTeamTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/harri_new.jpeg?alt=media&token=c381ffb4-0dfb-4298-a8b4-541a99e38306")
    let urlTextTeamTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Team3.txt?alt=media&token=59bca252-ae97-467e-a610-1d2dbab87e9c")
    let urlImageTeamThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/mahyar.JPG?alt=media&token=7f4ac56e-ee3a-4bd0-abf8-006675032486")
    let urlTextTeamThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Team4.txt?alt=media&token=9e5b6fca-9e94-482a-adf5-3675efdebf1a")
    let urlTextTeamOneEmail = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/text_team_two_email.txt?alt=media&token=b2b8a46a-c565-461e-a9a0-dfe2e428913e")
    let urlTextTeamOnePhone = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/text_team_two_phone.txt?alt=media&token=25d87645-a4ed-40ce-8eac-ba566bf67498")
    let urlTextTeamTwoEmail = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/text_team_three_email.txt?alt=media&token=9cd10250-6616-41ce-9c4b-99547b26e70f")
    let urlTextTeamTwoPhone = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/text_team_three_phone.txt?alt=media&token=e28148ef-1bb6-4867-a464-60207edf4e03")
    let urlTextTeamThreeEmail = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/text_team_four_email.txt?alt=media&token=da06d81b-43c6-4716-a36b-4bbe97a62325")
    let urlTextTeamThreePhone = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/text_team_four_phone.txt?alt=media&token=ca723046-7391-4622-a9e3-2d3e7b486836")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        get_image(url: urlImageTeamTop!, imageView: imageViewTeamTop)
        get_image(url: urlImageTeamOne!, imageView: imageViewTeamOne)
        get_text(url: urlTextTeamOne!, textView: textViewTeamOne)
        get_text(url: urlTextTeamOneEmail!, textView: textViewOneEmail)
        get_text(url: urlTextTeamOnePhone!, textView: textViewOnePhone)
        get_image(url: urlImageTeamTwo!, imageView: imageViewTeamTwo)
        get_text(url: urlTextTeamTwo!, textView: textViewTeamTwo)
        get_text(url: urlTextTeamTwoEmail!, textView: textViewTwoEmail)
        get_text(url: urlTextTeamTwoPhone!, textView: textViewTwoPhone)
        get_image(url: urlImageTeamThree!, imageView: imageViewTeamThree)
        get_text(url: urlTextTeamThree!, textView: textViewTeamThree)
        get_text(url: urlTextTeamThreeEmail!, textView: textViewThreeEmail)
        get_text(url: urlTextTeamThreePhone!, textView: textViewThreePhone)
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

