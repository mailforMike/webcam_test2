//
//  datenstruktur.swift
//  webcam_test2
//
//  Created by Michael Holzinger on 13.01.19.
//  Copyright © 2019 Michael Holzinger. All rights reserved.
//

import Foundation

struct webcam {
    
    let bild_url : String
    let titel : String
    let lat : String
    let long : String
    let id: String
    
    init(titel:String,url:String,lat:String,long:String,id:String){
        self.titel = titel
        self.bild_url = url
        self.lat = lat
        self.long = long
        self.id = id
    }
    
}
