//
//  TableViewController.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 08/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//  Logic from Werkcollege Tableviewbis


import UIKit

class TableViewController: UITableViewController {
    
    var personen = SingletonPersoon.instance.getPersonen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            vc.persoon = personen[(indexPath?.row)!]
        }
    }
}
