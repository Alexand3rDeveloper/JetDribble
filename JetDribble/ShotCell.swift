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
        
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "shotCell")
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    private func configTextView(){
        self.shotDescriptionView.textContainer.maximumNumberOfLines = 2
        self.shotDescriptionView.textContainer.lineBreakMode = .byWordWrapping
    }
    
    public func setupCell(presenter:CellViewModel){
        self.configTextView()
        self.shotImageView.sd_setImage(with: URL(string: presenter.pictureURL))
        shotDescriptionView.text = presenter.textFieldText
        shotTitleView.text = presenter.labelText
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
