//
//  MapViewController.swift
//  CapitalSocial
//
//  Created by Marcos Garcia on 12/24/18.
//  Copyright © 2018 Marcos Garcia. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        
        displayLocationsInMap()
        displayDeviceLocation()
    }
}

extension MapViewController {
    /// Use map view model here to set up the map in the view
    func displayLocationsInMap() {
        let model = MapViewModel.init()
        
        guard let locationsInfo = model.parseLocationsFrom(Constants.locations) else {
            return
        }
        
        guard let locations = model.getLocationsFor(locationsInfo) else {
            return
        }
        
        for location in locations {
            let annotation = MKPointAnnotation()
            let lat = Double(truncating: location.latitude)
            let long = Double(truncating: location.longitude)
            let centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude:long)
            annotation.coordinate = centerCoordinate
            mapView.addAnnotation(annotation)
        }
    }
    
    func displayDeviceLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        
        mapView.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Device Location"
        mapView.addAnnotation(annotation)
    }
}
    
