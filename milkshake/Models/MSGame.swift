//
//  MSGame.swift
//  milkshake
//
//  Created by Brian Correa on 5/18/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import MapKit

class MSGame: NSObject, MKAnnotation {
    
    var name: String!
    var address = ""
    var lng: Double!
    var lat: Double!
    var rating: Double!
    
    
    //MARK: Required Protocol Methods for MK Annotation
    
    var title: String? {
        return self.name
    }
    
    var subtitle: String? {
        return self.address
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.lat, self.lng)
    }
    
    //MARK: Parsing Function
    
    func populate(info: Dictionary<String, AnyObject>){
        if let n = info["name"] as? String {
            self.name = n
        }
        
        if let geometry = info["geometry"] as? Dictionary<String, AnyObject>{
            if let location = geometry["location"] as? Dictionary<String, AnyObject>{
                if let lng = location["lng"] as? Double {
                    self.lng = lng
                }
                if let lat = location["lat"] as? Double {
                    self.lat = lat
                }
            }
        }
        
        if let rating = info["rating"] as? Double {
            self.rating = rating
        }
        
        if let vicinity = info["vicinity"] as? String {
            self.address = vicinity
        }
     
    }
}