//
//  PersoonViewController.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 14/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//  Logic for Mapview, locations and annotations from https://www.youtube.com/watch?v=UyiuX8jULF4
//  basic logic for imagemagnifier from https://www.youtube.com/watch?v=cawmiVPOFWY 


import UIKit
import MapKit
import CoreLocation

class PersoonViewController: UIViewController, MKMapViewDelegate {
    var persoon = Persoon()
    
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var myVoornaam: UILabel!
    
    @IBOutlet weak var myNaam: UILabel!
    
    @IBOutlet weak var myAdres: UILabel!
    @IBOutlet weak var myTelefoon: UILabel!
    
    @IBOutlet weak var myGPS: UILabel!
    
    @IBOutlet weak var myMap: MKMapView!
    
    

    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myImage.image = UIImage(named: persoon.foto)
        self.myVoornaam.text = persoon.voornaam
        self.myNaam.text = persoon.naam
        self.myTelefoon.text = persoon.telefoon
        self.myAdres.text = persoon.straat + " " + persoon.nummer + "\n" + persoon.postcode + " " + persoon.gemeente
        self.myGPS.text = persoon.gpsLA.description + ", " + persoon.gpsLO.description
        
        
        let location = CLLocationCoordinate2DMake(persoon.gpsLA, persoon.gpsLO)
        
        let span = MKCoordinateSpanMake(0.2, 0.2)

        let region = MKCoordinateRegion(center: location, span: span)
        
        myMap.setRegion(region, animated: true)
        
        let annotation:PersoonAnnotation = PersoonAnnotation(coordinate: location, title: "Hello I am here", subtitle: "Chillin at "+persoon.voornaam+"'s " + "place")
        
        myMap.addAnnotation(annotation)
        
    }
    
   
}
