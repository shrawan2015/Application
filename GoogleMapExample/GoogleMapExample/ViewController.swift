//
//  ViewController.swift
//  GoogleMapExample
//
//  Created by SKS on 13/06/17.
//  Copyright © 2017 GoogleMapExample. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate,GMSMapViewDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var centerImageIcon: UIImageView!
    @IBOutlet weak var googleMap: GMSMapView!
    var currentLocation:CLLocationCoordinate2D!
    var finalPositionAfterDragging:CLLocationCoordinate2D?
    var locationMarker:GMSMarker!
   
    lazy var locationManager: CLLocationManager = {
        var _locationManager = CLLocationManager()
        _locationManager.delegate = self
        _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        _locationManager.activityType = .automotiveNavigation
        _locationManager.distanceFilter = 10.0
        return _locationManager
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        googleMap.delegate = self
        centerImageIcon.layer.zPosition = 1
        searchBar.layer.zPosition  = 1
        isAuthorizedtoGetUserLocation()
    
    }
    
    func isAuthorizedtoGetUserLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    /**
     * Called repeatedly during any animations or gestures on the map (or once, if the camera is
     * explicitly set). This may not be called for all intermediate camera positions. It is always
     * called for the final position of an animation or gesture.
     */
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
      print("didchange")
        
        //called everytime
        wrapperFunctionToShowPosition(mapView: mapView)
    }
    
    /**
     * Called when the map becomes idle, after any outstanding gestures or animations have completed (or
     * after the camera has been explicitly set).
     */
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print("idleAt")
        
        //called when the map is idle
        wrapperFunctionToShowPosition(mapView: mapView)

    }
    
    
    func wrapperFunctionToShowPosition(mapView:GMSMapView){
        let geocoder = GMSGeocoder()
        let latitute = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
        let position = CLLocationCoordinate2DMake(latitute, longitude)
        geocoder.reverseGeocodeCoordinate(position) { response , error in
            if error != nil {
                print("GMSReverseGeocode Error: \(String(describing: error?.localizedDescription))")
            }else {
                let result = response?.results()?.first
                let address = result?.lines?.reduce("") { $0 == "" ? $1 : $0 + ", " + $1 }
                self.searchBar.text = address
            }
        }
    }
    
    
    //this method is called by the framework on  locationManager.requestLocation();
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didupdate location")
        let userLocation:CLLocation = locations[0] as CLLocation
        self.currentLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,longitude: userLocation.coordinate.longitude)
            let camera = GMSCameraPosition.camera(withLatitude: self.currentLocation.latitude, longitude:currentLocation.longitude, zoom: 300)
            let position = CLLocationCoordinate2D(latitude:  currentLocation.latitude, longitude: currentLocation.longitude)
            self.setupLocationMarker(coordinate: position)
            self.googleMap.camera = camera
            self.googleMap?.animate(to: camera)
            manager.stopUpdatingLocation()
        }


    func setupLocationMarker(coordinate: CLLocationCoordinate2D) {
        print("setup location")
        if locationMarker != nil {
            locationMarker.map = nil
        }
        locationMarker = GMSMarker(position: coordinate)
        locationMarker.map = googleMap
        locationMarker.appearAnimation =  .pop
        locationMarker.icon = GMSMarker.markerImage(with: UIColor.blue)
        locationMarker.opacity = 0.75
        locationMarker.isFlat = true
    }
    
}

