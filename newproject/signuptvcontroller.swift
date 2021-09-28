//
//  signuptvcontroller.swift
//  newproject
//
//  Created by Shaahid on 22/09/21.
//

import UIKit
import FlagPhoneNumber

class signuptvcontroller: UITableViewController {

 
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var usernameTextField: FPNTextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmpasswordField: UITextField!
    
    
    @IBOutlet weak var signupbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        signupbtn.layer.cornerRadius = 12
        nameField.addBottomBorder()
        usernameTextField.addBottomBorder()
        passwordField.addBottomBorder()
        confirmpasswordField.addBottomBorder()
      
    
    }

    @IBAction func backtologintapped(_ sender: UIButton) {
        
        
        var log = false
        if self.navigationController != nil{
          for controller in self.navigationController!.viewControllers as Array {
              if controller.isKind(of: ViewController.self) {
                  self.navigationController!.popToViewController(controller, animated: true)
                log = true
                  break
              }else{
                log = false
            }
          }
        }else{
          self.performSegue(withIdentifier: "logintap", sender: self)
        }
        if log == false{
          self.performSegue(withIdentifier: "logintap", sender: self)
        }
        
    }
    
}
