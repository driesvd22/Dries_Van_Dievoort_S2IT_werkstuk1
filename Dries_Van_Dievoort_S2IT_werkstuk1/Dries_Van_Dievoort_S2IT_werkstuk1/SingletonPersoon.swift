//
//  SingletonPersoon.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 30/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import Foundation
import MapKit

final class SingletonPersoon {
    static let instance = SingletonPersoon()
    
    private var personen = [Persoon]()
    
    private init(){
        self.personen = [
            Persoon(voornaam: "General", naam: "Grievous", foto: "grievous", straat: "galaxystraat", nummer: "1", postcode: "1700", gemeente: "Dilbeek", gpsLA: 50.668189,gpsLO: -112.836632, telefoon: "04787878787"),
            Persoon(voornaam: "Darth", naam: "Vader", foto: "vader", straat: "Papastraat", nummer: "1", postcode: "1703", gemeente: "Itterbeek", gpsLA: -16.500000, gpsLO: -180.000000, telefoon: "505165121302"),
            Persoon(voornaam: "Yoda", naam: "Jedi", foto: "yoda", straat: "groenestraat", nummer: "2653", postcode: "5225", gemeente: "ergens", gpsLA: 34.016667, gpsLO: 71.583333, telefoon: "2056405415416"),
            Persoon(voornaam: "Obi Wan", naam: "Kenobi", foto: "obiwan", straat: "wanstraat", nummer: "3521", postcode: "6541", gemeente: "nog ergens anders", gpsLA: -6.200000, gpsLO: 106.800000, telefoon: "54110564153"),
            Persoon(voornaam: "Darth", naam: "Maul", foto: "maul", straat: "malolaan", nummer: "52", postcode: "9854", gemeente: "Dilbeek", gpsLA: 14.016667, gpsLO: 51.583333, telefoon: "651165165615"),
            Persoon(voornaam: "Darth", naam: "Sidious", foto: "sidious", straat: "malolaan", nummer: "56", postcode: "9854", gemeente: "Dilbeek", gpsLA: 27.307056, gpsLO: -108.175477, telefoon: "654156421")
        ]
    }
    
    public func getPersonen() -> [Persoon]{
        return self.personen
    }
}
