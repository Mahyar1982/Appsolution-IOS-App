//
//  FirstViewController.swift
//  appsolution
//
//  Created by mahyar on 20/03/2018.
//  Copyright © 2018 Appsolution. All rights reserved.
//

import UIKit
//import FirebaseStorage
import ZDCChat

class FirstViewController: UIViewController {
    @IBOutlet weak var imageViewHomeTop: UIImageView!
    @IBOutlet weak var imageViewHomeOne: UIImageView!
    @IBOutlet weak var textViewHomeOne: UITextView!
    @IBOutlet weak var imageViewHomeTwo: UIImageView!
    @IBOutlet weak var textViewHomeTwo: UITextView!
    @IBAction func buttonNavigationChat(_ sender: UIBarButtonItem) {
        ZDCChat.start(in: self.navigationController, withConfig: nil)
    }
    @IBAction func buttonNavigationFeedback(_ sender: UIBarButtonItem) {
        
    }
    
    
    let urlImageHomeTop = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/slider4.jpg?alt=media&token=2821e037-d86c-438e-ba21-3c055bc5bc5b")
    let urlImageHomeOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/home_image_two.jpg?alt=media&token=f01bba17-d978-4213-b6e2-963e3fb12ac3")
    let urlTextHomeOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/textview_home_two.txt?alt=media&token=210411df-602c-45cd-83c9-3690279c4765")
    let urlImageHomeTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/rsz_slider1.jpg?alt=media&token=e8fde76c-d079-4ca5-9d6d-398eef84b2a5")
    let urlTextHomeTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/textview_home_three.txt?alt=media&token=c6a13be8-a9e7-42ea-9442-35628c5d1360")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //downloadImage()
        
        textViewHomeOne.isEditable = false
        textViewHomeTwo.isEditable = false
        
            //imageViewHomeTop.contentMode = .scaleAspectFit
            //downloadImage2(url: url)
        get_image(url: urlImageHomeTop!, imageView: imageViewHomeTop)
        get_image(url: urlImageHomeOne!, imageView: imageViewHomeOne)
        get_text(url: urlTextHomeOne!, textView: textViewHomeOne)
        get_image(url: urlImageHomeTwo!, imageView: imageViewHomeTwo)
        get_text(url: urlTextHomeTwo!, textView: textViewHomeTwo)
        
    //    textViewHomeTwo.text = "Something"
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
//}
    
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
