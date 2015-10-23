//
//  RegisterPageViewController.swift
//  DonatingParkingSpotE
//
//  Created by Apple on 10/19/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextFiled: UITextField!
    override func viewDidLoad() {
        
       super.viewDidLoad()
    }

    
    override func didReceiveMemoryWarning() {
        
        
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
       
        let userEmail = userEmailTextField.text;
        
        let userPassword = userPasswordTextField.text;
        
        let userRepeatPassword = repeatPasswordTextFiled.text;
        
        //Check empty content
        if userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty
        {
        
        
        // display a message and return
            
            displayMyAlertMessage("All fileds are required.");
            return;
        
       }
        
        
        //Check if password matches
        if(userPassword != userRepeatPassword)
        {
            displayMyAlertMessage("Password does not match.");
        //dispaly message and return
            return;
        }
        
        
        //Store data 
        NSUserDefaults.standardUserDefaults().setObject(userEmail,forKey:"userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword,forKey:"userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        //confirm regisration 
        var myAlert=UIAlertController(title: "Alert", message:"Registration is successful.",
            preferredStyle: UIAlertControllerStyle.Alert);
        let okayAction=UIAlertAction(title: "Okay", style:UIAlertActionStyle.Default)
            {
                action in
                self.dismissViewControllerAnimated(true, completion: nil);
                
        }
        myAlert.addAction(okayAction);
        self.presentViewController(myAlert,animated:true, completion: nil);
        
    }
    func displayMyAlertMessage(usermessage:String)
    {
        let myAlert=UIAlertController(title: "Alert", message:usermessage,
            preferredStyle: UIAlertControllerStyle.Alert);
        let okayAction=UIAlertAction(title: "Okay", style:UIAlertActionStyle.Default, handler:nil)
        myAlert.addAction(okayAction);
        self.presentViewController(myAlert, animated: true, completion: nil);
        
        
    }
    
}

