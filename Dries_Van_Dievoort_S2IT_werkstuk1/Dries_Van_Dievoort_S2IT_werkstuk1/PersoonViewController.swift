//
//  ViewController.swift
//  Dries_Van_Dievoort_S2IT_werkstuk1
//
//  Created by student on 08/05/18.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit

class PersoonViewController: UIViewController {

    var persoon = Persoon()
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func transformImage(_ sender: UIPinchGestureRecognizer) {
        self.myImageView.transform =  CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        
        
        //sender.scale = 1
        
        print("ok")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myLabel.text = persoon.voornaam + " " + persoon.naam
        self.myImageView.image = UIImage(named: persoon.foto)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

