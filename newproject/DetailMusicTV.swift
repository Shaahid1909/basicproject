//
//  DetailMusicTV.swift
//  newproject
//
//  Created by Shaahid on 29/09/21.
//

import UIKit

class DetailMusicTV: UITableViewController {
    
    var passSong = ""
    var passCategory = ""
    
    @IBOutlet weak var songtitle: UILabel!
    
    @IBOutlet weak var categorytitle: UILabel!
    
    @IBAction func backbtntapped(_ sender: Any) {
        var log = false
        if self.navigationController != nil{
          for controller in self.navigationController!.viewControllers as Array {
              if controller.isKind(of: MyMusicTV.self) {
                  self.navigationController!.popToViewController(controller, animated: true)
                log = true
                  break
              }else{
                log = false
            }
          }
        }else{
          self.performSegue(withIdentifier: "backtomusic", sender: self)
        }
        if log == false{
          self.performSegue(withIdentifier: "backtomusic", sender: self)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        songtitle.text = passSong
        categorytitle.text = passCategory
    
        print("songtitle: \(passSong)")
        print("categorytitle: \(passCategory)")
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }


}
