//
//  SecondViewController.swift
//  appsolution
//
//  Created by mahyar on 20/03/2018.
//  Copyright © 2018 Appsolution. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageViewServiceTop: UIImageView!
    @IBOutlet weak var imageViewServiceOne: UIImageView!
    @IBOutlet weak var textViewServiceOne: UITextView!
    @IBOutlet weak var imageViewServiceTwo: UIImageView!
    @IBOutlet weak var textViewServiceTwo: UITextView!
    @IBOutlet weak var imageViewServiceThree: UIImageView!
    @IBOutlet weak var textViewServiceThree: UITextView!

    
    let urlImageServiceTop = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/slider5.jpeg?alt=media&token=f2fd9d84-79b8-4977-9615-2eb6b49b61d3")
    let urlImageServiceOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Android_app.png?alt=media&token=31543edd-1bc2-43c3-8193-885245e49433")
    let urlTextServiceOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/textview_service_two.txt?alt=media&token=a20c75b4-b38c-4891-b567-44e9b2d3404b")
    let urlImageServiceTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/android_design.png?alt=media&token=0241551c-36cf-47dc-a458-b404e818b88f")
    let urlTextServiceTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/textview_service_three.txt?alt=media&token=b2113113-9e9a-41f1-b688-d2471335c57d")
    let urlImageServiceThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/support-487504_960_720.jpg?alt=media&token=a4d90b19-2de1-4f74-9809-b19415066cfa")
    let urlTextServiceThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/textview_service_four.txt?alt=media&token=f1227c17-bdbe-48bc-8505-677570d7daed")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        get_image(url: urlImageServiceTop!, imageView: imageViewServiceTop)
        get_image(url: urlImageServiceOne!, imageView: imageViewServiceOne)
        get_text(url: urlTextServiceOne!, textView: textViewServiceOne)
        get_image(url: urlImageServiceTwo!, imageView: imageViewServiceTwo)
        get_text(url: urlTextServiceTwo!, textView: textViewServiceTwo)
        get_image(url: urlImageServiceThree!, imageView: imageViewServiceThree)
        get_text(url: urlTextServiceThree!, textView: textViewServiceThree)

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
