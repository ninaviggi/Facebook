//
//  LoginViewController.swift
//  Facebook
//
//  Created by Mariannina Viggi on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var fieldParentView: UIView!
    var initialY: CGFloat!
    var offset: CGFloat!
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    @IBAction func didTapLogin(sender: UIButton) {
        sender.selected = true
        activityIndicator.startAnimating()
        loginButton.selected = true
        
        
        if emailField.text == "email@gmail.com" && passwordField.text == "password" {
            
            delay(2,closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("loginSegue", sender:nil)
            })
            
        } else {
            delay(2,closure: { () -> () in
                self.activityIndicator.stopAnimating()
                self.loginButton.selected = false
            })
        }
    
    }
    
  

    
    func keyboardWillShow(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialY + offset
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialY
        
    }
    
    @IBAction func didTap(sender: AnyObject) {
        
        view.endEditing(true)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY = fieldParentView.frame.origin.y
        offset = -50
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
