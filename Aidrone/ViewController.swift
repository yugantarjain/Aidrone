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

//class Drone: NSObject, MKOverlay
//{
//    var coordinate: CLLocationCoordinate2D
//
//    var boundingMapRect: MKMapRect
//
//    init(coordinate: CLLocationCoordinate2D)
//    {
//        self.coordinate = coordinate
//
//        let abcd = MKMapPoint.init(coordinate)
//        let efgh = MKMapSize.init(width: 1, height: 1)
//        let vbn = MKMapRect.init(origin: abcd, size: efgh)
//        self.boundingMapRect = vbn
////        self.boundingMapRect.size = MKMapSize.init(width: 1, height: 1)
////        self.boundingMapRect.origin = MKMapPoint.init(coordinate)
//        super.init()
//    }
//}

class Drone: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D)
    {
        self.coordinate = coordinate
        super.init()

    }
}

class ViewController: UIViewController, MKMapViewDelegate {
    
    let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    var annotations = [MKAnnotation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref = Database.database().reference()
//        ref.child("persons").observe(.value) { (snapshot) in
//            for data in snapshot.children.allObjects as! [DataSnapshot]
//            {
//                let a = data.value as? [String: AnyObject]
//                let lati = a?["Latitude"] as! Double
//                let longi = a?["Longitude"] as! Double
//                self.test(la: lati, lo: longi)
//            }
//        }
        
        test(la: 12.61215,lo: 74.92886)
        test(la: 12.61119, lo: 74.92886)
        test(la: 12.6947, lo: 74.92941)
        test(la: 12.6088, lo: 74.9298)
        test(la: 12.60679, lo: 74.93779)
        test(la: 12.60348, lo: 74.9322)
        
        

        
        ref.child("boats").observe(.value) { (snapshot) in
            self.Map.delegate = self

            for data in snapshot.children.allObjects as! [DataSnapshot]
            {
                let a = data.value as? [String: AnyObject]
                let lati = a?["Latitude"] as! Double
                let longi = a?["Longitude"] as! Double
                let mn = CLLocationCoordinate2D.init(latitude: lati, longitude: longi)
                let drone = Drone(coordinate: mn)
                let abcd = self.mapView(self.Map, viewFor: drone)
                self.Map.addAnnotation(drone)
//                self.Map.addOverlay(drone)
                self.Map.setCenter(mn, animated: true)
//                self.test2(la: lati, lo: longi)
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
//        Map.addAnnotations(annotations)
    }
    
    @IBOutlet weak var Map: MKMapView!
    
    
    func test(la: Double, lo: Double)
    {
        let mn = CLLocationCoordinate2D.init(latitude: la, longitude: lo)
        let abcd = MKPointAnnotation.init()
        abcd.coordinate.latitude = la
        abcd.coordinate.longitude = lo
        
        annotations.append(abcd)
        Map.addAnnotation(abcd)
//        Map.setCenter(mn, animated: true)
    }
    
//    func test2(la: Double, lo: Double)
//    {
//        let mn = CLLocationCoordinate2D.init(latitude: la, longitude: lo)
//        let abcd = MKCircle.init(center: mn, radius: 20)
//        Map.addOverlay(abcd)
//        Map.setCenter(mn, animated: true)
//    }
    
//    func test2(la: Double, lo: Double)
//    {
//        let mn = CLLocationCoordinate2D.init(latitude: la, longitude: lo)
//        let abcd = MKMarkerAnnotationView.init()
//        abcd.animatesWhenAdded = true
//        abcd.tintColor = UIColor.blue
////        abcd.coordinate.latitude = la
////        abcd.coordinate.longitude = lo
////        annotations.append(abcd)
////        Map.addAnnotation(abcd?.annotation)
////        Map.setCenter(mn, animated: true)
//
//
//        let gh = MKPointAnnotation.init()
//        gh.coordinate.latitude = la
//        gh.coordinate.longitude = lo
//
//    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        var abcd = mapView.dequeueReusableAnnotationView(withIdentifier: "boats")
        let abcd = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "boats")
        abcd.animatesDrop = true
//        abcd.image = UIImage(named: "dr")
//        abcd.tintColor = UIColor.blue
        abcd.pinTintColor = UIColor.blue
        return abcd
    }
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        // 1
//        let identifier = "Capital"
//
//        // 2
//        if annotation is Capital {
//            // 3
//            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//            if annotationView == nil {
//                //4
//                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                annotationView!.canShowCallout = true
//
//                // 5
//                let btn = UIButton(type: .detailDisclosure)
//                annotationView!.rightCalloutAccessoryView = btn
//            } else {
//                // 6
//                annotationView!.annotation = annotation
//            }
//
//            return annotationView
//        }
//
//        // 7
//        return nil
//    }
}

