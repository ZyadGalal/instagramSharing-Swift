//
//  ViewController.swift
//  instagramSharing
//
//  Created by Zyad Galal on 10/13/18.
//  Copyright © 2018 Zyad Galal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var documentInteractionController : UIDocumentInteractionController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func share(_ sender: Any) {
        insta()
    }
    func insta()
    {
        let image = UIImage(named: "iphone")
        let instagramURL = NSURL(string: "instagram://app")
        if UIApplication.shared.canOpenURL(instagramURL! as URL) {
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let saveImagePath = (documentsPath as NSString).appendingPathComponent("Image.igo")
            let imageData = UIImagePNGRepresentation(image!)
            do {
                try imageData?.write(to: URL(fileURLWithPath: saveImagePath), options:  NSData.WritingOptions(rawValue: 0))
            } catch {
                print("Instagram sharing error")
            }
            documentInteractionController = UIDocumentInteractionController.init(url: URL.init(fileURLWithPath: saveImagePath))
            documentInteractionController.uti = "com.instagram.exclusivegram"
            
            if !documentInteractionController.presentOpenInMenu(from: self.view.frame, in: self.view, animated: true) {
                print("Instagram not found")
            }
        }
        else {
            print("Instagram not found")
        }
    }
}

