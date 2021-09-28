//
//  IntialViewController.swift
//  newproject
//
//  Created by Shaahid on 27/09/21.
//

import UIKit

class IntialViewController: UIViewController {

    @IBOutlet weak var progressBar:UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateProgress()
        DispatchQueue.main.async {
         
        self.gotoLogin()
            
        }
    }
    

    func updateProgress(){
        UIView.animate(withDuration: 2.0) {
            self.progressBar.setProgress(1.0, animated: true)
            
        }
        
       
    }
    
    func gotoLogin(){
      performSegue(withIdentifier: "next", sender: self)
    }

}
