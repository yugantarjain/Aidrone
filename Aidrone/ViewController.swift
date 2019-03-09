//
//  ViewController.swift
//  Aidrone
//
//  Created by yugantar jain on 10/03/19.
//  Copyright © 2019 yugantar jain. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let xy = CLLocationCoordinate2D(latitude: 10, longitude: 77)
        let span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        Map.region = MKCoordinateRegion(center: xy, span: span)
        let ann = MKPointAnnotation.init()
        ann.coordinate.latitude = 10
        ann.coordinate.longitude = 77
        Map.addAnnotation(ann)
    }
    @IBOutlet weak var Map: MKMapView!
    

}

