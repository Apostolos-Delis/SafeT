//
//  ViewController.swift
//  SafeT
//
//  Created by Jason Ho on 12/21/17.
//  Copyright © 2017 Jason Ho. All rights reserved.
//

import UIKit
import Mapbox
import Alamofire
import SwiftyJSON
//import MapboxNavigation
//import MapboxDirections
//import MapboxCoreNavigation


class ViewController: UIViewController, MGLMapViewDelegate {
    
//    var mapView: NavigationMapView!
//    var directionsRoute: Route?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let styleURL = URL(string: "mapbox://styles/stitchy/cjbzqgu1q0lyq2rp7fnp25th0")
        // Local paths are also acceptable.
        
        let mapView = MGLMapView(frame: view.bounds, styleURL: styleURL)
        mapView.setCenter(CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), zoomLevel: 10.5, animated: false)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(mapView)
        
        
        
        
//        // Do any additional setup after loading the view, typically from a nib.
//
//        let mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.lightStyleURL())
//        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        mapView.tintColor = .darkGray
//
//        // Set the map’s center coordinate and zoom level.
//        mapView.setCenter(CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437), zoomLevel: 10.5, animated: false)
//
////        mapView = NavigationMapView(frame: view.bounds)
//
//        view.addSubview(mapView)
//
//        mapView.delegate = self
        
        
    }
    
//    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
//
//        let source = MGLVectorSource(identifier: "trees", configurationURL: URL(string: "mapbox://styles/stitchy/cjbzqgu1q0lyq2rp7fnp25th0")!)
//
//        style.addSource(source)
//
//        let layer = MGLCircleStyleLayer(identifier: "tree-style", source: source)
//
//        // The source name from the source's TileJSON metadata: mapbox.com/api-documentation/#retrieve-tilejson-metadata
//        layer.sourceLayerIdentifier = "geodata_day_0_6-a2oj8m"
//
//        let stops = [
//            0: MGLStyleValue(rawValue: UIColor(red:1.00, green:0.72, blue:0.85, alpha:1.0)),
//            2: MGLStyleValue(rawValue: UIColor(red:0.69, green:0.48, blue:0.73, alpha:1.0)),
//            4: MGLStyleValue(rawValue: UIColor(red:0.61, green:0.31, blue:0.47, alpha:1.0)),
//            7: MGLStyleValue(rawValue: UIColor(red:0.43, green:0.20, blue:0.38, alpha:1.0)),
//            16: MGLStyleValue(rawValue: UIColor(red:0.33, green:0.17, blue:0.25, alpha:1.0))
//        ]
//
//        layer.circleColor = MGLStyleValue<UIColor>(interpolationMode: .interval,
//                                                   sourceStops: stops,
//                                                   attributeName: "AGE",
//                                                   options: nil)
//
//        layer.circleRadius = MGLStyleValue(rawValue: 3)
//
//        style.addLayer(layer)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

