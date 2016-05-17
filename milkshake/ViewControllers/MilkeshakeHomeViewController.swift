//
//  MilkeshakeHomeViewController.swift
//  milkshake
//
//  Created by Brian Correa on 5/16/16.
//  Copyright © 2016 milkshake-systems. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MilkeshakeHomeViewController: MilkshakeViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    
    override func loadView() {
        
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 255/255, green: 44/255, blue: 0/255, alpha: 1)
        
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()

    }
    
    //MARK - LocationManager Delegate
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus){
        if(status == .AuthorizedWhenInUse){
            print("AuthorizedWhenInUse")
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        print("didUpdateLocations: \(locations)")
        
        if(locations.count == 0){
            return
        }
    
        let loc = locations[0]
        let now = NSDate().timeIntervalSince1970
        let locationTime = loc.timestamp.timeIntervalSince1970
        let delta = now-locationTime
        
        print("NOW = \(now)")
        print("Location Time = \(locationTime)")
        print("DELTA = \(delta)")
        
        if(delta > 10){
            return
        }
        
        if (loc.horizontalAccuracy > 100){
            return
        }
        
        self.locationManager.stopUpdatingLocation()
        print("Found Current Location: \(loc.description)")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
