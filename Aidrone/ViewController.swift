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
//    var annView = MKAnnotationView.init()
    var annotations = [MKAnnotation]()
    var i = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        Map.region = MKCoordinateRegion(center: xy, span: span)
//        ref = Database.database().reference()
//        ref.child("People").observe(.value) { (snapshot) in
//            for data in snapshot.children.allObjects as! [DataSnapshot]
//            {
//                let a = data.value as? [String: AnyObject]
//                let lati = a?["Lat"] as! Double
//                let longi = a?["Long"] as! Double
////                self.updateCentre(lat: lati, long: longi)
//                let xy = CLLocationCoordinate2D(latitude: lati, longitude: longi)
//                self.ann.coordinate.latitude = lati
//                self.ann.coordinate.longitude = longi
//                self.Map.addAnnotation(self.ann)
//
//
//            }
//        }
        
        
        let ann1 = MKPointAnnotation.init()
        ann1.coordinate.latitude = 9
        ann1.coordinate.longitude = 26
//        annotations.append(ann1)
        
//        print(annotations)

        
        let ann2 = MKPointAnnotation.init()
        ann2.coordinate.latitude = 11
        ann2.coordinate.longitude = 24
        
//        annotations.append(ann2)
        
        for a in annotations
        {
            print(a.coordinate)
        }
        print(annotations)
        
        
        test(la: 9, lo: 26)
        test(la: 11, lo: 24)
        
        for a in annotations
        {
            print(a.coordinate)
        }
        
        
        

        
        
        
//        Map.addAnnotation(ann1)
//        Map.addAnnotation(ann2)
        Map.addAnnotations(annotations)
        
        
        
        
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
        annotations.append(ann)
        for a in annotations
        {
            Map.addAnnotation(a)
        }
        print(ann.coordinate)
    }
    
    func test(la: Double, lo: Double)
    {
        let abcd = MKPointAnnotation.init()
        abcd.coordinate.latitude = la
        abcd.coordinate.longitude = lo
        annotations.append(abcd)
    }
}

