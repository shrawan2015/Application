//
//  Place.swift
//  DemoMVC
//
//  Created by Anuradha Sharma on 03/02/17.
//  Copyright © 2017 Anuradha Sharma. All rights reserved.
//

import UIKit
import GooglePlaces

class Place: NSObject
{
    var placeId = String()
    var placeDescription = String()
    var returnDelegate : AnyObject?
    var returnSelector : Selector?
    
    var placeClient:GMSPlacesClient!
    
    func searchPlace(searchString : String, delegate: AnyObject, selector : Selector)
    {
        returnDelegate = delegate
        returnSelector = selector
        let requestUrl = Constants.kBasrUrl + String("input=\(searchString)&key=\(Constants.kGooglePlacesAPIKey)")
        ServerRequest.sharedInstance.connectToServerWithRequest(url: requestUrl, returnSelector : #selector(Place.fillPlaces(_:)), returnDelegate : self)
    }
    
    func fillPlaces(_ responseDict : [String : Any])
    {
        placeClient = GMSPlacesClient.shared()

        
        var arrObjPlaces = [Place]()
        if responseDict["status"] as! String == "OK"
        {
            let arrayPlaces : [[String : Any]] = responseDict["predictions"] as! [[String : Any]]
            
            for dict in arrayPlaces
            {
                let objPlace = Place()
                objPlace.placeId = dict["place_id"] as! String
                
                placeClient.lookUpPlaceID("ChIJV4k8_9UodTERU5KXbkYpSYs", callback: { (place, err) -> Void in
                    //                    if let error = error {
                    //                        print("lookup place id query error: \(error.localizedDescription)")
                    //                        return
                    //placeId	String	"EiFZb25nZSBTdHJlZXQsIFRvcm9udG8sIE9OLCBDYW5hZGE"
                    if err != nil {
                        print("lookup place id query error: \(err!.localizedDescription)")
                        return
                    }
                    print("****\(place) ************")
                    
                })

                
                objPlace.placeDescription = dict["description"] as! String
                arrObjPlaces.append(objPlace)
            }
        }
  
        returnDelegate?.performSelector(onMainThread: returnSelector!, with: arrObjPlaces, waitUntilDone: true)
    }
    
    
    
}
