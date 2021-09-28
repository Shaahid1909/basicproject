//
//  bannercell.swift
//  newproject
//
//  Created by Shaahid on 22/09/21.
//

import UIKit

class bannercell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannercollcell", for: indexPath) as! BannerCollectionViewCell
        
        cell.imgview.image = UIImage(named: "\(bannerArray[indexPath.row])")
        
        return cell
    }
    
  

    var bannerArray = ["1.png","2.png","3.png","4.png","5.png"]

    @IBOutlet weak var pagecntrl: UIPageControl!
    @IBOutlet weak var bannercollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bannercollectionView.delegate = self
        bannercollectionView.dataSource = self
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { (val) in
            if let coll  = self.bannercollectionView {
                if let cell = coll.visibleCells.first,var indexPath = coll.indexPath(for: cell){
                    indexPath.row = indexPath.row+1
                    if indexPath.row <= self.bannerArray.count-1{
                        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                           coll.scrollToItem(at: indexPath, at: .right, animated: true)
                           self.pagecntrl.currentPage = indexPath.row
                        }, completion: nil)
                    }else{
                        indexPath.row = 0
                        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                           coll.scrollToItem(at: indexPath, at: .left, animated: true)
                           self.pagecntrl.currentPage = indexPath.row
                        }, completion: nil)
                    }
                }
            }
        }

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
      let viewrect = collectionView.bounds.size
      return viewrect
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
      let visibleIndex = Int(targetContentOffset.pointee.x / bannercollectionView.frame.width)
        pagecntrl.currentPage = visibleIndex
    }
    
    
}
