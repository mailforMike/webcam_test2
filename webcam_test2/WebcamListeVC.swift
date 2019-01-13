//
//  WebcamListeVC.swift
//  webcam_test2
//
//  Created by Michael Holzinger on 13.01.19.
//  Copyright © 2019 Michael Holzinger. All rights reserved.
//

import UIKit
import Alamofire 
import SwiftyJSON
import SDWebImage

class WebcamListeVC: UIViewController {

    var webcams = [webcam]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWebcams(lat: "48.219623", long: "16.354551")
        
    }
    
    
    
    func getWebcams(lat:String,long:String){
        
        let key = "085793e1e7msh6c027f963532522p1cc723jsncdd554b19694"
        let limit = "50"
        
        let radius = "200" //kilometer
        
        let url = "https://webcamstravel.p.rapidapi.com/webcams/list/limit=\(limit)/nearby=\(lat),\(long),\(radius)/orderby=distance,asc"
        
        let parameters : [String:String] = [
            "show" : "webcams:image,location",
            ]
        
        let headers: HTTPHeaders = [
            "X-RapidAPI-Key" : key
        ]
        
        Alamofire.request(url, method: .get, parameters: parameters, headers:headers).responseJSON { (ergebniss) in
            let json = JSON(ergebniss.result.value!) // <— swifty json
            
            //print(json)
            for (nummer,inhalt) in json["result"]["webcams"] {
                let we = webcam(titel: inhalt["title"].stringValue,
                                url: inhalt["image"]["current"]["preview"].stringValue,
                                lat: inhalt["location"]["latitude"].stringValue,
                                long: inhalt["location"]["longitude"].stringValue,
                                id: inhalt["id"].stringValue,
                                country: inhalt["location"]["country"].stringValue
                )
                self.webcams.append(we)
                //print(" \(nummer): \(we.titel) \(we.country)")
            }
            
            
            print("Dateneinlesen Fertig")
            
        }
        
    }

}

