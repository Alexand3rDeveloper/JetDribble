//
//  ShotCell.swift
//  JetDribble
//
//  Created by Alex on 12/21/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import SDWebImage

class ShotCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    
    @IBOutlet weak var shotDescriptionView: UITextView!
    
    @IBOutlet weak var shotTitleView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        debugPrint("SETUP OUR CELL");
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "shotCell")//reuseIdentifier)
//        self.setupCell()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    public func setupCell(presenter:CellViewModel){
        debugPrint("presenter.pictureURL",presenter.pictureURL)
        self.shotImageView.sd_setImage(with: URL(string: presenter.pictureURL))
        shotDescriptionView.text = presenter.textFieldText
        shotTitleView.text = presenter.labelText
        debugPrint("SETUP OUR CELL");
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
