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
        let xy = CLLocationCoordinate2D(latitude: 9, longitude: 76)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        Map.region = MKCoordinateRegion(center: xy, span: span)
    }
    @IBOutlet weak var Map: MKMapView!
    

}

