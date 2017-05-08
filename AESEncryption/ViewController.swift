//
//  ViewController.swift
//  AESEncryption
//
//  Created by vivek gajbe on 03/05/16.
//  Copyright © 2016 vivek gajbe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
   var uuid = UIDevice.currentDevice().identifierForVendor!.UUIDString
    var key : String! = nil
    var iv : String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(uuid)
        let strTemp : String = uuid

        if strlen(strTemp) > 32
        {
            key = (strTemp as NSString).substringToIndex(32)//32 bit
            iv = (strTemp as NSString).substringToIndex(16) // 16 bit
        }
        print(strlen(key),strlen(iv))
        print(key)
        print(iv)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func EncryptText(sender: AnyObject)
    {
        txtName.text =  try! txtName.text!.aesEncrypt(key, iv: iv) as NSString as String
        
    }
    @IBAction func decryptText(sender: AnyObject) {
    
        txtName.text = try! txtName.text!.aesDecrypt(key, iv: iv)
        print(txtName.text)
    }


}

