//
//  ListeTableViewCell.swift
//  webcam_test2
//
//  Created by Michael Holzinger on 13.01.19.
//  Copyright © 2019 Michael Holzinger. All rights reserved.
//

import UIKit
import SDWebImage


class ListeTableViewCell: UITableViewCell {

    @IBOutlet weak var bild: UIImageView!
    @IBOutlet weak var textfeld: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateZelle(webcam: webcam){
        bild.sd_setImage(with: URL(string: webcam.bild_url), completed: nil)
        textfeld.text = webcam.titel
    }

}
