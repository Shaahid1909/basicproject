//
//  MyMusicTV.swift
//  newproject
//
//  Created by Shaahid on 28/09/21.
//

import UIKit

class MyMusicTV: UITableViewController {

    var image = ["1.png","2.png","3.png","4.png","5.png"]
    
    var songlist = ["Song 1","Song 2","Song 3","Song 4","Song 5"]
    
    var categorylist = ["jazz","pop","rock","melody","classical"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return image.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyMusicCell", for: indexPath) as! MyMusicCell
        
        cell.musictitleimage.image = UIImage(named: "\(image[indexPath.row])")
        cell.titletext.text = songlist[indexPath.row]
        cell.categorytext.text = categorylist[indexPath.row]

    

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as! MyMusicCell
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "didselect") as! DetailMusicTV
        viewController.modalPresentationStyle = .fullScreen
        viewController.passSong = currentCell.titletext.text ?? ""
        viewController.passCategory = currentCell.categorytext.text ?? ""
       // self.pushViewController(viewController, animated: true , completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }

    
}
