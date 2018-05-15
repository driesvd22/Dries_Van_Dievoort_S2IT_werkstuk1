//
//  LocatieViewController.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 15/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocatieViewController: UIViewController, CLLocationManagerDelegate {
    
    var personen = [Persoon]()
    
    
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
        
        let persoon1 = Persoon(voornaam: "General", naam: "Grievous", foto: "grievous", straat: "galaxystraat", nummer: "1", postcode: "1700", gemeente: "Dilbeek", gpsLA: 50.668189,gpsLO: -112.836632, telefoon: "04787878787")
        let persoon2 = Persoon(voornaam: "Darth", naam: "Vader", foto: "vader", straat: "Papastraat", nummer: "1", postcode: "1703", gemeente: "Itterbeek", gpsLA: -16.500000, gpsLO: -180.000000, telefoon: "505165121302")
        let persoon3 = Persoon(voornaam: "Yoda", naam: "Jedi", foto: "yoda", straat: "groenestraat", nummer: "2653", postcode: "5225", gemeente: "ergens", gpsLA: 34.016667, gpsLO: 71.583333, telefoon: "2056405415416")
        let persoon4 = Persoon(voornaam: "Obi Wan", naam: "Kenobi", foto: "obiwan", straat: "wanstraat", nummer: "3521", postcode: "6541", gemeente: "nog ergens anders", gpsLA: -6.200000, gpsLO: 106.800000, telefoon: "54110564153")
        let persoon5 = Persoon(voornaam: "Darth", naam: "Maul", foto: "maul", straat: "malolaan", nummer: "52", postcode: "9854", gemeente: "Dilbeek", gpsLA: 14.016667, gpsLO: 51.583333, telefoon: "651165165615")
        let persoon6 = Persoon(voornaam: "Darth", naam: "Sidious", foto: "sidious", straat: "malolaan", nummer: "56", postcode: "9854", gemeente: "Dilbeek",gpsLA: 27.307056, gpsLO: -108.175477, telefoon: "654156421")
        
        personen.append(persoon1)
        personen.append(persoon2)
        personen.append(persoon3)
        personen.append(persoon4)
        personen.append(persoon5)
        personen.append(persoon6)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        manager.pausesLocationUpdatesAutomatically = true
        
        
        for persoon in personen {
            let location = CLLocationCoordinate2DMake(persoon.gpsLA, persoon.gpsLO)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Hello it's "+persoon.naam+" over here"
            annotation.subtitle = "chillin at my place"
            myMap.addAnnotation(annotation)
        }
        
        
        
        
        
    }
}
