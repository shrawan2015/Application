//
//  ServerRequest.swift
//  DemoMVC
//
//  Created by Anuradha Sharma on 03/02/17.
//  Copyright © 2017 Anuradha Sharma. All rights reserved.
//

import UIKit

class ServerRequest: NSObject
{
    static let sharedInstance = ServerRequest()
    
    func connectToServerWithRequest(url : String, returnSelector : Selector, returnDelegate : AnyObject)
    {
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 60.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async {
                if (error != nil) {
                    print(error!)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(response!)
                    print(httpResponse?.statusCode as Any)
                    if httpResponse?.statusCode == 200
                    {
                        do {
                            let responseDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                            print(responseDict!)
                            if let JSON = responseDict
                            {
                                print("JSON: \(JSON)")
                                returnDelegate.performSelector(onMainThread: returnSelector, with: JSON, waitUntilDone: true)
                            }
                            else
                            {
                                let responseDict = ["status" : "Fail"]
                                returnDelegate.performSelector(onMainThread: returnSelector, with: responseDict, waitUntilDone: true)
                            }
                        } catch
                        {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        })
        dataTask.resume()
    }
}
