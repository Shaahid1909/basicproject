//
//  MyMusicCell.swift
//  newproject
//
//  Created by Shaahid on 28/09/21.
//

import UIKit

class MyMusicCell: UITableViewCell {

    @IBOutlet weak var musictitleimage: UIImageView!
    @IBOutlet weak var titletext: UILabel!
    @IBOutlet weak var categorytext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
