//
//  fullscreenSimpleVC.swift
//  webcam_test2
//
//  Created by Michael Holzinger on 13.01.19.
//  Copyright © 2019 Michael Holzinger. All rights reserved.
//

import UIKit
import SDWebImage


class fullscreenSimpleVC: UIViewController {

    @IBOutlet weak var bild: UIImageView!
    @IBOutlet weak var textfeld: UILabel!
    
    var webcam : webcam?
    
    @IBAction func zurück_pressed(_ sender: Any) {
        self.dismiss(animated: true) {
            //nil
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        updateVC(webcam: webcam!)
        
        // Do any additional setup after loading the view.
    }

    func updateVC(webcam: webcam){
        
        bild.sd_setImage(with: URL(string: webcam.bild_url), completed: nil)
        textfeld.text = webcam.titel
    }

}
