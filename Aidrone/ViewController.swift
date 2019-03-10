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
    var annotations = [MKAnnotation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref = Database.database().reference()
        ref.child("persons").observe(.value) { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot]
            {
                let a = data.value as? [String: AnyObject]
                let lati = a?["Latitude"] as! Double
                let longi = a?["Longitude"] as! Double
                self.test(la: lati, lo: longi)
            }
        }
        
        
//        let ann1 = MKPointAnnotation.init()
//        ann1.coordinate.latitude = 9
//        ann1.coordinate.longitude = 26
////        annotations.append(ann1)
//
////        print(annotations)
//
//
//        let ann2 = MKPointAnnotation.init()
//        ann2.coordinate.latitude = 11
//        ann2.coordinate.longitude = 24
//
////        annotations.append(ann2)
//
//        for a in annotations
//        {
//            print(a.coordinate)
//        }
//        print(annotations)
//
//
//        test(la: 9, lo: 26)
//        test(la: 20, lo: 24)
//
//        for a in annotations
//        {
//            print(a.coordinate)
//        }
        
        
        

        
        
        
//        Map.addAnnotation(ann1)
//        Map.addAnnotation(ann2)
        Map.addAnnotations(annotations)
    }
    
    @IBOutlet weak var Map: MKMapView!
    
    
    func test(la: Double, lo: Double)
    {
        let mn = CLLocationCoordinate2D.init(latitude: la, longitude: lo)
        let abcd = MKPointAnnotation.init()
        abcd.coordinate.latitude = la
        abcd.coordinate.longitude = lo
        annotations.append(abcd)
        Map.setCenter(mn, animated: true)
    }
}

