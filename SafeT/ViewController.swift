//
//  ViewController.swift
//  SafeT
//
//  Created by Jason Ho on 12/18/17.
//  Copyright © 2017 Jason Ho. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //Variables
    var vwGMap : GMSMapView?
    
    //Declare Instance Variables
    let locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        vwGMap = GMSMapView()
        
        let camera = GMSCameraPosition.camera(withLatitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!, zoom: 17.0)
        
        vwGMap = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        
        vwGMap?.camera = camera
        
        self.view = vwGMap
        
        locationManager.stopUpdatingLocation()
        
        readJson()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let newLocation = locations.last
        
        vwGMap?.camera = GMSCameraPosition.camera(withTarget: newLocation!.coordinate, zoom: 17.0)
        
        vwGMap?.settings.myLocationButton = true
        
        self.view = self.vwGMap
        
        /*
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
        marker.title = "Your Current Location"
        
        marker.map = self.vwGMap
 */
        
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    func readJson() {
        let path = Bundle.main.path(forResource: "json_0", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let crimes = try JSONDecoder().decode([String : [String]].self, from: data)
            //print(crimes)
            
            for (key, value) in crimes {
                var longitude : Float = Float(value[1])!
                var latitude : Float = Float(value[0])!
                var category : String = value[2]
                createMarker(latitude: latitude, longitude: longitude, category: category)
                

            }
        }
        catch {}
    }
    
    func createMarker(latitude : Float, longitude : Float, category : String) {
        
        let position = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        let marker = GMSMarker(position: position)
        marker.title = category
        marker.map = self.vwGMap
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

