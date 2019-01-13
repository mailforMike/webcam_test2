//
//  fullscreenSliderVC.swift
//  webcam_test2
//
//  Created by Michael Holzinger on 13.01.19.
//  Copyright © 2019 Michael Holzinger. All rights reserved.
//

import UIKit

class fullscreenSliderVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var webcams = [webcam]()
    var selected : Int?

    @IBOutlet weak var anzeige: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        anzeige.delegate=self
        anzeige.dataSource=self
        
        let t = IndexPath(row: selected!, section: 0)
        
        anzeige.scrollToItem(at: t, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return webcams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fullscreenCell", for: indexPath) as! FullscreenCollectionViewCell
        
        cell.updateAnzeige(webcam: webcams[indexPath.row])
        
        return cell
    }

    

}
