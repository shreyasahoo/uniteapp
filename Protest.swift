//
//  Protest.swift
//  protestapp
//
//  Created by Shreya Sahoo on 11/12/16.
//  Copyright © 2016 Shreya Sahoo. All rights reserved.
//

import UIKit

class Protest {
    var name : String
    var description: String
    var latitude: Double
    var longitude: Double
    var address: String
    var startTime: Date
    
    init(name: String, description: String, latitude: Double, longitude: Double, address: String, startTime: Date) {
        
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.startTime = startTime
        
    }
    

}
