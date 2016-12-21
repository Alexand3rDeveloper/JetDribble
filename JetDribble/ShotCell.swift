//
//  ShotCell.swift
//  JetDribble
//
//  Created by Alex on 12/21/16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

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
        self.setupCell()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setupCell(){
        debugPrint("SETUP OUR CELL");
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
