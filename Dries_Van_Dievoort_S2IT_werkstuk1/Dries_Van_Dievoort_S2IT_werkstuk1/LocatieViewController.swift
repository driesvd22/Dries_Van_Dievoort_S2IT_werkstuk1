//
//  LocatieViewController.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 15/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//  Logic for Mapview, locations and annotations from https://www.youtube.com/watch?v=UyiuX8jULF4

import UIKit
import MapKit
import CoreLocation

class LocatieViewController: UIViewController, CLLocationManagerDelegate {
    
    var personen = SingletonPersoon.instance.getPersonen()
    
    
    @IBOutlet weak var myMap: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(100,100)
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        myMap.setRegion(region, animated: true)
        self.myMap.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        manager.pausesLocationUpdatesAutomatically = true
        
        
        for persoon in personen {
            let location = CLLocationCoordinate2DMake(persoon.gpsLA, persoon.gpsLO)
            let annotation:PersoonAnnotation = PersoonAnnotation(coordinate: location, title: "Hello it's "+persoon.naam+" over here", subtitle: "chillin at my place")
            myMap.addAnnotation(annotation)
        }
        
        
        
        
        
    }
}
