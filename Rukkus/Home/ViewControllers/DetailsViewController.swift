//
//  DetailsViewController.swift
//  Rukkus
//
//  Created by abdelrahman mohamed on 10/4/17.
//  Copyright © 2017 abdelrahman mohamed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    
    
    var viewSelectedData: RukkusResults!
    
    
    func configureWith(data: RukkusResults) {
        if let str = data.headshot?.large, let url = URL(string: str){
            eventImageView.af_setImage(withURL: url)
        }
        
        title = data.name
        eventDateLabel.text = data.dateHuman
        eventTimeLabel.text = data.timeHuman
        categoryLabel.text = data.category
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWith(data: viewSelectedData)

    }


}
