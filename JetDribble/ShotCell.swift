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
    
    public func setupCell(viewModel:CellViewModel){
        self.configTextView()
        self.shotImageView.sd_setImage(with: URL(string: viewModel.pictureURL))
        shotDescriptionView.text = viewModel.textFieldText
        shotTitleView.text = viewModel.labelText
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
