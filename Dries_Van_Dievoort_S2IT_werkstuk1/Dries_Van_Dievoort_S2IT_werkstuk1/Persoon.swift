//
//  Persoon.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 08/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit

class Persoon {
    var voornaam: String
    var naam: String
    var foto: String
    var straat: String
    var nummer: String
    var postcode: String
    var gemeente: String
    var gps: String
    var telefoon: String
    
    init() {
        voornaam = ""
        naam = ""
        foto = ""
        straat = ""
        nummer = ""
        postcode = ""
        gemeente = ""
        gps = ""
        telefoon = ""
    }
    
    init(voornaam: String, naam:String, foto: String, straat: String, nummer: String, postcode: String, gemeente: String, gps: String, telefoon: String){
        self.voornaam = voornaam
        self.naam = naam
        self.foto = foto
        self.straat = straat
        self.nummer = nummer
        self.postcode = postcode
        self.gemeente = gemeente
        self.gps = gps
        self.telefoon = telefoon
    }
}
