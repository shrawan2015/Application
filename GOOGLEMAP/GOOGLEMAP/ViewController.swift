//
//  ViewController.swift
//  GOOGLEMAP
//
//  Created by SKS on 02/05/17.
//  Copyright © 2017 IQKeyboardManagerSwift. All rights reserved.
//

import UIKit
import GoogleMaps


//class PlaceMarker: GMSMarker {
//    // 1
//    let place: GooglePlace
//    
//    // 2
//    init(place: GooglePlace) {
//        self.place = place
//        super.init()
//        
//        position = place.coordinate
//        icon = UIImage(named: place.placeType+"_pin")
//        groundAnchor = CGPoint(x: 0.5, y: 1)
//        appearAnimation = kGMSMarkerAnimationPop
//    }
//}


class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate{
    @IBOutlet weak var searchBar: UISearchBar!

    
    @IBOutlet weak var tableView: UITableView!
    let locationManager = CLLocationManager()

    //let dataProvider = GoogleDataProvider()
    let searchRadius: Double = 1000
    
    
    @IBOutlet weak var mapView: GMSMapView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       var didFindMyLocation = false
        
    
        self.view.insertSubview(mapView, belowSubview: tableView)

//        tableView.register(NewTableVIEWTableViewCell.self, forCellReuseIdentifier: "myawsemoecell")


        tableView.register(UINib(nibName: "NewTableVIEWTableViewCell", bundle: nil), forCellReuseIdentifier: "myawsemoecell")

        tableView.register(UINib(nibName: "MyCurrentLocationTableViewCell", bundle: nil), forCellReuseIdentifier: "MyCurrentLocationcell")

        
        
        // Table view delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        mapView.addObserver(self, forKeyPath: "myLocation", options: NSKeyValueObservingOptions.new, context: nil)

        //position the initial position
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: 48.857165, longitude: 2.354613, zoom: 8.0)
        mapView.camera = camera
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
        

    
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
 
//    
//     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//       
//    }
//    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        var cell :UITableViewCell
        
                 if(indexPath.row == 4) {
             cell = tableView.dequeueReusableCell(withIdentifier: "MyCurrentLocationcell", for: indexPath as IndexPath) as! MyCurrentLocationTableViewCell

        }else{
                    cell = tableView.dequeueReusableCell(withIdentifier: "myawsemoecell", for: indexPath as IndexPath) as! NewTableVIEWTableViewCell
                    

        }
        
        return cell
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let location = locations.last! as CLLocation
        
        _ = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

      //  let marker = GMSMarker(position: (self.selectedPlace?.coordinate)!)
       // marker.title = selectedPlace?.name
      //  marker.snippet = selectedPlace?.formattedAddress
      //  marker.map = mapView
        
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
      //  self.map.setRegion(region, animated: true)
    }
    
    
    //if we have no permission to access user location, then ask user for permission.
    func isAuthorizedtoGetUserLocation() {
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        mapView.delegate = self

        
        // Dispose of any resources that can be recreated.
    }
    
    func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
        
        // 1
        let geocoder = GMSGeocoder()
        
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let address = response?.firstResult() {
                
                // 3
               // let lines = address.lines as! [String]
               // self.addressLabel.text = lines.joinWithSeparator("\n")
                
                // 4
                UIView.animate(withDuration: 0.25) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
//    func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D) {
//        // 1
//        mapView.clear()
//        // 2
//        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:searchRadius, types: searchedTypes) { places in
//            for place: GooglePlace in places {
//                // 3
//                let marker = PlaceMarker(place: place)
//                // 4
//                marker.map = self.mapView
//            }
//        }
//    }
//    
    
    
    
}
    extension ViewController: CLLocationManagerDelegate {
        // 2
        private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            // 3
            if status == .authorizedWhenInUse {
                
                // 4
                locationManager.startUpdatingLocation()
                
                //5
                mapView.isMyLocationEnabled = true
                mapView.settings.myLocationButton = true
            }
        }
        
        // 6
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
                
                // 7
                mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
                
                // 8
                locationManager.stopUpdatingLocation()
            }
            
    }

}

extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView!, idleAt position: GMSCameraPosition!) {
        reverseGeocodeCoordinate(coordinate: position.target)
    }
    
//    func mapView(mapView: GMSMapView!, markerInfoContents marker: GMSMarker!) -> UIView! {
//        // 1
//        let placeMarker = marker as! PlaceMarker
//        
//        // 2
//        if let infoView = UIView.viewFromNibName("MarkerInfoView") as? MarkerInfoView {
//            // 3
//            infoView.nameLabel.text = placeMarker.place.name
//            
//            // 4
//            if let photo = placeMarker.place.photo {
//                infoView.placePhoto.image = photo
//            } else {
//                infoView.placePhoto.image = UIImage(named: "generic")
//            }
//            
//            return infoView
//        } else {
//            return nil
//        }
//    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        //mapCenterPinImage.fadeOut(0.25)
        return false
    }

    
}

