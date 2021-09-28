//
//  HomeTableController.swift
//  newproject
//
//  Created by Shaahid on 22/09/21.
//
import SafariServices
import UIKit

class HomeTableController: UITableViewController{

    
    var loadingView: LoadingView!
    
    @IBOutlet weak var logoutbtn: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            if let loaderView = self.loadingView{ // If loadingView already exists
                       self.loadingView.hide()
                   }
        }

      logoutbtn.layer.cornerRadius = 10
      
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
        return 1
        }else if section == 1{
        return 1
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "bannertvcell", for: indexPath) as! bannercell
            return cell
        }else if indexPath.section == 1{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "hometrendtvcell", for: indexPath) as! HomeTrendingTableCell
              return cell1
        }
        
        return UITableViewCell()
    }
    
    @IBAction func logouttapped(_ sender: UIButton) {
        var alertStyle = UIAlertController.Style.actionSheet

        if UIDevice.current.userInterfaceIdiom == .pad{
            alertStyle = UIAlertController.Style.alert
        }
        let actionSheet = UIAlertController(title: "Are you sure you would like to logout of the app?",
                                            message: nil,
                                            preferredStyle: alertStyle)
        let buttonAction = UIAlertAction(title: "Log out", style: .destructive) { (alertAction) -> Void in
            self.performSegue(withIdentifier: "gotologin", sender: self)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) -> Void in }

        actionSheet.addAction(buttonAction)
        actionSheet.addAction(cancelAction)
        present(actionSheet, animated: true)
        
    }
    
}
