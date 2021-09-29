//
//  DetailCell.swift
//  newproject
//
//  Created by Shaahid on 29/09/21.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var detailsongtitle: UILabel!
    @IBOutlet weak var detailCategory: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
