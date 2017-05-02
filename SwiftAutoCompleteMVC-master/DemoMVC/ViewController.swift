//
//  ViewController.swift
//  DemoMVC
//
//  Created by Anuradha Sharma on 03/02/17.
//  Copyright © 2017 Anuradha Sharma. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var placeClient:GMSPlacesClient!

    //MARK:- Properties
    @IBOutlet var txtSearch: UITextField!
    @IBOutlet var dropDowwnTable: UITableView!
    
    
    //MARK:- Variables
    var arrPlaces = [Place]()
    @IBOutlet weak var mapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        txtSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        dropDowwnTable.layer.borderColor = UIColor.black.cgColor
        dropDowwnTable.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TextField Delegate
    func textFieldDidChange(_ textField: UITextField)
    {
        if textField.text != ""
        {
            callAPIToGetPlaces(searchText: textField.text!)
        }
        else
        {
            dropDowwnTable.isHidden = true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:- Get Places API
    func callAPIToGetPlaces(searchText : String)
    {
        let objPlace = Place()
        objPlace.searchPlace(searchString: searchText,delegate: self,selector: #selector(serverResponseSearchPlace))
    }
    
    func serverResponseSearchPlace(arrObjPlace : [Place])
    {
        if arrObjPlace.count > 0
        {
            dropDowwnTable.isHidden = false
        }
        else
        {
            dropDowwnTable.isHidden = true
        }
        arrPlaces = arrObjPlace
        dropDowwnTable.reloadData()
    }
    
    
    
    
    
    //MARK:- TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrPlaces.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = dropDowwnTable.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        let objPlace : Place = arrPlaces[indexPath.row]
        
        cell.textLabel?.text = objPlace.placeDescription
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let objPlace : Place = arrPlaces[indexPath.row]
        print(objPlace.placeId)
    
        self.placefind(value: objPlace.placeId)
        //position the initial position
       
    }
    
    func placefind(value:String){
        placeClient = GMSPlacesClient.shared()
        placeClient.lookUpPlaceID(value, callback: { (place, err) -> Void in
            //                    if let error = error {
            //                        print("lookup place id query error: \(error.localizedDescription)")
            //                        return
            //placeId	String	"EiFZb25nZSBTdHJlZXQsIFRvcm9udG8sIE9OLCBDYW5hZGE"
            if err != nil {
                print("lookup place id query error: \(err!.localizedDescription)")
                return
            }else {
                let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: (place?.coordinate.latitude)! , longitude: (place?.coordinate.longitude)!, zoom: 8.0)
                self.mapView.camera = camera
            }
            print("****\(place) ************")
            
        })
    }
}

