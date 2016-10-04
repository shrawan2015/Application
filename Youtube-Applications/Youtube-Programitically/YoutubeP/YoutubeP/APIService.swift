//
//  APIService.swift
//  YoutubeP
//
//  Created by SKS on 04/10/16.
//  Copyright © 2016 Youtube-Programatic. All rights reserved.
//

import Foundation
import UIKit

class APIService: NSObject {
    static let sharedInstance = APIService()
    var videos : [Video] = []

    
    func fetchVideos(completion: @escaping ([Video]) -> ()) {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    
                    video.title = dictionary["title"] as? String
                    video.thumbNailImage = dictionary["thumbnail_image_name"] as? String
                    
                    //                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    //
                    //                    let channel = Channel()
                    //                    channel.name = channelDictionary["name"] as? String
                    //                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    //
                    //                    video.channel = channel
                    
                    videos.append(video)
                }
                
                DispatchQueue.main.async {
                    completion(videos)
                    //self.collectionView?.reloadData()
                    
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
            
            }.resume()
    }
    
    
}
