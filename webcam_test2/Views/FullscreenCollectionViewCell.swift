//
//  FullscreenCollectionViewCell.swift
//  webcam_test2
//
//  Created by Michael Holzinger on 13.01.19.
//  Copyright © 2019 Michael Holzinger. All rights reserved.
//

import UIKit

class FullscreenCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bild: UIImageView!
    
    func updateAnzeige(webcam: webcam){
        bild.sd_setImage(with: URL(string: webcam.bild_url), completed: nil)
        //textfeld.text = webcam.titel
    }
    
    
}
