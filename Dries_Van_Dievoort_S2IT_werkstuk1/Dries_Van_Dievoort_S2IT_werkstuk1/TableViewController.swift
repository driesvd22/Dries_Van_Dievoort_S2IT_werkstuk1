//
//  TableViewController.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 08/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//  Logic from Werkcollege Tableviewbis


import UIKit

class TableViewController: UITableViewController {
    
    var personen = [Persoon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persoon1 = Persoon(voornaam: "General", naam: "Grievous", foto: "grievous", straat: "galaxystraat", nummer: "1", postcode: "1700", gemeente: "Dilbeek", gpsLA: 50.668189,gpsLO: -112.836632, telefoon: "04787878787")
        let persoon2 = Persoon(voornaam: "Darth", naam: "Vader", foto: "vader", straat: "Papastraat", nummer: "1", postcode: "1703", gemeente: "Itterbeek", gpsLA: -16.500000, gpsLO: -180.000000, telefoon: "505165121302")
        let persoon3 = Persoon(voornaam: "Yoda", naam: "Jedi", foto: "yoda", straat: "groenestraat", nummer: "2653", postcode: "5225", gemeente: "ergens", gpsLA: 34.016667, gpsLO: 71.583333, telefoon: "2056405415416")
        let persoon4 = Persoon(voornaam: "Obi Wan", naam: "Kenobi", foto: "obiwan", straat: "wanstraat", nummer: "3521", postcode: "6541", gemeente: "nog ergens anders", gpsLA: -6.200000, gpsLO: 106.800000, telefoon: "54110564153")
        let persoon5 = Persoon(voornaam: "Darth", naam: "Maul", foto: "maul", straat: "malolaan", nummer: "52", postcode: "9854", gemeente: "Dilbeek", gpsLA: 14.016667, gpsLO: 51.583333, telefoon: "651165165615")
        let persoon6 = Persoon(voornaam: "Darth", naam: "Sidious", foto: "sidious", straat: "malolaan", nummer: "56", postcode: "9854", gemeente: "Dilbeek", gpsLA: 27.307056, gpsLO: -108.175477, telefoon: "654156421")
        
        
        personen.append(persoon1)
        personen.append(persoon2)
        personen.append(persoon3)
        personen.append(persoon4)
        personen.append(persoon5)
        personen.append(persoon6)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personen.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = personen[indexPath.row].voornaam + " " + personen[indexPath.row].naam
        cell.imageView?.image = UIImage(named: personen[indexPath.row].foto)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "naarPersoonView"
        {
            let vc =  segue.destination as! PersoonViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            vc.personen = personen
            vc.persoon = personen[(indexPath?.row)!]
        }
    }
}
