//
//  PersoonAnnotation.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 30/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import Foundation
import MapKit

class PersoonAnnotation: NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title:String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
