//
//  AlbumsTV.swift
//  newproject
//
//  Created by Shaahid on 29/09/21.
//

import UIKit

class AlbumsTV: UITableViewController {

    
    var img = ["1.png","2.png","3.png","4.png","5.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return img.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imagecell", for: indexPath) as! AlbumCell
        cell.albumimage.image = UIImage(named: "\(img[indexPath.row])")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as! AlbumCell
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "imageview") as! AlbumImageview
        viewController.modalPresentationStyle = .fullScreen
        viewController.zoomimage = currentCell.albumimage.image
       // self.pushViewController(viewController, animated: true , completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }


}
