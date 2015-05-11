//
//  ViewController.swift
//  RevivalxSwiftAESCrypt
//
//  Created by Mohammad Nurdin bin Norazan on 5/8/15.
//  Copyright (c) 2015 Nurdin Norazan Services. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var password: String = "123456"
    var imageData: NSData!
    var status: Bool = false
    var base64String: String!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var image : UIImage = UIImage(named:"rsz_swift-og")!
        imageView.image = image
        imageData = UIImagePNGRepresentation(image)
        base64String = imageData.base64EncodedStringWithOptions(.allZeros)
        println(base64String)
        
        textView.text = base64String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnEncrypt(sender: AnyObject) {
        
        if status == false {
            status = true
            base64String = AESCrypt.encrypt(base64String, password: password)
            println(base64String)
            textView.text = base64String
            let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0))
            var decodedimage = UIImage(data: decodedData!)
            println(decodedimage)
            imageView.image = decodedimage as UIImage?
        }
        
    }

    @IBAction func btnDecrypt(sender: AnyObject) {
        
        if status == true {
            status = false
            base64String = AESCrypt.decrypt(base64String, password: password)
            println(base64String)
            textView.text = base64String
            let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0))
            var decodedimage = UIImage(data: decodedData!)
            println(decodedimage)
            imageView.image = decodedimage as UIImage?
        }
    }
}

