//
//  ViewController.swift
//  webcam_test2
//
//  Created by Michael Holzinger on 13.01.19.
//  Copyright © 2019 Michael Holzinger. All rights reserved.
//

import UIKit
import Alamofire 
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWebcams(lat: "12", long: "23")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getWebcams(lat:String,long:String){
        
        var webcams = [webcam]()
        
        let key = "085793e1e7msh6c027f963532522p1cc723jsncdd554b19694"
        let limit = "40"
        let country = "at"
        
        let url = "https://webcamstravel.p.rapidapi.com/webcams/list/country=\(country)/limit=\(limit)"
        
        let parameters : [String:String] = [
            "show" : "webcams:image,location",
            ]
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key" : key
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, headers:headers).responseJSON { (ergebniss) in
            let json = JSON(ergebniss.result.value!) // <— swifty json
            
            for (nummer,inhalt) in json["result"]["webcams"] {
                let we = webcam(titel: inhalt["title"].stringValue, url: inhalt["image"]["current"]["preview"].stringValue)
                self.webcams.append(we)
                //print(" \(nummer): \(we.titel)")
            }
            
            print("Fertig")
            
        }
        
    }


}

