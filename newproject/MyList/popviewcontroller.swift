//
//  popviewcontroller.swift
//  newproject
//
//  Created by Shaahid on 29/09/21.
//

import UIKit

class popviewcontroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  

    @IBOutlet weak var sometextfield: UITextField!
    @IBOutlet weak var datefield: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func submitbuttontapped(_ sender: UIButton) {
        
        
        performSegue(withIdentifier: "back", sender: self)
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "back") {
        // pass data to next view
        let viewController = segue.destination as? libraryviewController
        viewController?.list = sometextfield.text!
        viewController?.tabview.reloadData()
    }
}

}
