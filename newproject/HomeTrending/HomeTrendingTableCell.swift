//
//  HomeTrendingTableCell.swift
//  newproject
//
//  Created by Shaahid on 22/09/21.
//

import UIKit

class HomeTrendingTableCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

    
    var hometrendArray = ["3.png","4.png","1.png","2.png","5.png"]

    
    @IBOutlet weak var hometrendcollcell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hometrendcollcell.delegate = self
        hometrendcollcell.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hometrendArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hometrend", for: indexPath) as! hometrendcollcell
        cell.image.image = UIImage(named: "\(hometrendArray[indexPath.row])")
        
       
        
        return cell
    }
    
    

}
