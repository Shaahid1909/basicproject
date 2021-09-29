//
//  libraryviewController.swift
//  newproject
//
//  Created by Shaahid on 29/09/21.
//

import UIKit

class libraryviewController: UITableViewController {
    
    @IBOutlet var tabview: UITableView!
    var list = ""
    
    @IBAction func plusbtntapped(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
     let viewController = storyboard.instantiateViewController(withIdentifier: "popview") as! popviewcontroller
     viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewController, animated: true)
        
     print("button tapped!!")
        
    }
    
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! libraryviewcell
        
        cell.labtext.text = list
    
        return cell
    }



}
