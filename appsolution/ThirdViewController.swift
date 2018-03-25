//
//  ThirdViewController.swift
//  appsolution
//
//  Created by mahyar on 20/03/2018.
//  Copyright © 2018 Appsolution. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var imageViewPortfolioTop: UIImageView!
    @IBOutlet weak var imageViewPortfolioOne: UIImageView!
    @IBOutlet weak var textViewPortfolioOne: UITextView!
    @IBOutlet weak var imageViewPortfolioTwo: UIImageView!
    @IBOutlet weak var textViewPortfolioTwo: UITextView!
    @IBOutlet weak var imageViewPortfolioThree: UIImageView!
    @IBOutlet weak var textViewPortfolioThree: UITextView!


    let urlImagePortfolioTop = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/Portfolio1.JPG?alt=media&token=6d149448-2335-468b-85cd-999956bfe4ec")
    let urlImagePortfolioOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/portfolio2.JPG?alt=media&token=2269d14e-e66a-49f3-81d0-18e58fee0805")
    let urlTextPortfolioOne = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/portfolio_two.txt?alt=media&token=33dedee0-b091-4c7c-bdb7-43d2ebfd9db1")
    let urlImagePortfolioTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/portfolio3.JPG?alt=media&token=146bbfa5-6ffb-4c7e-ba3a-b8e4a8646606")
    let urlTextPortfolioTwo = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/portfolio_three.txt?alt=media&token=5c78b174-3d5c-4926-a0e1-18867b9dc65a")
    let urlImagePortfolioThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/portfolio4.JPG?alt=media&token=3d2d2632-689a-4278-a782-1e4370fb90a8")
    let urlTextPortfolioThree = URL(string: "https://firebasestorage.googleapis.com/v0/b/appsolution-669ae.appspot.com/o/portfolio_four.txt?alt=media&token=3767dc98-f61d-4a8c-93e9-91accbf37328")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        get_image(url: urlImagePortfolioTop!, imageView: imageViewPortfolioTop)
        get_image(url: urlImagePortfolioOne!, imageView: imageViewPortfolioOne)
        get_text(url: urlTextPortfolioOne!, textView: textViewPortfolioOne)
        get_image(url: urlImagePortfolioTwo!, imageView: imageViewPortfolioTwo)
        get_text(url: urlTextPortfolioTwo!, textView: textViewPortfolioTwo)
        get_image(url: urlImagePortfolioThree!, imageView: imageViewPortfolioThree)
        get_text(url: urlTextPortfolioThree!, textView: textViewPortfolioThree)
        
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
