//
//  HomeTableViewCell.swift
//  Rukkus
//
//  Created by abdelrahman mohamed on 10/4/17.
//  Copyright © 2017 abdelrahman mohamed. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWith(data: RukkusResults) {
        if let str = data.headshot?.normal, let url = URL(string: str){
            eventImageView.af_setImage(withURL: url)
        }
        
        eventNameLabel.text = data.name
        eventDateLabel.text = data.dateHuman
        eventTimeLabel.text = data.timeHuman
        categoryLabel.text = data.category
    }
    
    override func prepareForReuse() {
        eventImageView.image = nil
    }

}
