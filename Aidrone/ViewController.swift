//
//  ViewController.swift
//  Aidrone
//
//  Created by yugantar jain on 10/03/19.
//  Copyright © 2019 yugantar jain. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
//    let ref = Database.database().reference()
    let ann = MKPointAnnotation.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Map.region = MKCoordinateRegion(center: xy, span: span)
        ref = Database.database().reference()
        ref.child("People").observe(.value) { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot]
            {
                let a = data.value as? [String: AnyObject]
                let lati = a?["Lat"] as! Double
                let longi = a?["Long"] as! Double
                self.updateCentre(lat: lati, long: longi)
            }
        }
    }
    @IBOutlet weak var Map: MKMapView!
    
    func updateCentre(lat: Double, long: Double)
    {
        print(lat, long)
        
        let xy = CLLocationCoordinate2D(latitude: lat, longitude: long)
//        Map.region = MKCoordinateRegion(center: xy, span: span)
        Map.setCenter(xy, animated: true)
        
        ann.coordinate.latitude = lat
        ann.coordinate.longitude = long
        Map.addAnnotation(ann)
        
        print(ann.coordinate)
    }
}

