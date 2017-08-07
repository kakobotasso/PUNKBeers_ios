//
//  RequestApi.swift
//  PUNKBeers
//
//  Created by Kako Botasso on 15/07/17.
//  Copyright © 2017 Kako Botasso. All rights reserved.
//

import Foundation
import UIKit

class RequestApi {
    // MARK: - Properties
    let path = NetworkApi.URL
    
    // MARK: - Methods
    func requestBeers(onComplete : @escaping ([Beer]?) -> Void){
        guard let url = URL(string: path) else {
            onComplete(nil)
            return
        }
        
        NetworkApi.session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            }else{
                
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    
                    var beers: [Beer] = []
                    for item in json {
                        let beer = Beer()
                        
                        if let id = item["id"] {
                            beer.id = id as? Int
                        }
                        
                        if let name = item["name"] {
                            beer.name = name as? String
                        }
                        
                        if let tagline = item["tagline"] {
                            beer.tagline = tagline as? String
                        }
                        
                        if let firstBrewed = item["first_brewed"] {
                            beer.firstBrewed = firstBrewed as? String
                        }
                        
                        if let description = item["description"] {
                            beer.description = description as? String
                        }
                        
                        if let imageUrl = item["image_url"] {
                            beer.imageUrl = imageUrl as? String
                        }
                        
                        if let abv = item["abv"] {
                            beer.abv = abv as? Double
                        }
                        
                        if let ibu = item["ibu"] {
                            beer.ibu = ibu as? Double
                        }
                        
                        if let targetFg = item["target_fg"] {
                            beer.targetFg = targetFg as? Double
                        }
                        
                        if let targetOg = item["target_og"] {
                            beer.targetOg = targetOg as? Double
                        }
                        
                        if let ebc = item["ebc"] {
                            beer.ebc = ebc as? Double
                        }
                        
                        if let srm = item["srm"] {
                            beer.srm = srm as? Double
                        }
                        
                        if let ph = item["ph"] {
                            beer.ph = ph as? Double
                        }
                        
                        if let attenuationLevel = item["attenuation_level"] {
                            beer.attenuationLevel = attenuationLevel as? Double
                        }
                        
                        beers.append(beer)
                    }
                    onComplete(beers)
                } else {
                    onComplete(nil)
                }
                
            }
        }.resume()
        
    }
    
    func requestPhoto(url: String, onComplete : @escaping (UIImage?) -> Void){
        
        guard let url = URL(string: url) else {
            onComplete(nil)
            return
        }
        
        NetworkApi.session.downloadTask(with: url, completionHandler: { (url: URL?, response: URLResponse?, error: Error?) in
            if let response = response as? HTTPURLResponse, response.statusCode == 200, let url = url {
                let imageData = try! Data(contentsOf: url)
                let image = UIImage(data: imageData)
                onComplete(image)
            } else {
                onComplete(nil)
            }
        }).resume()
        

    }
    
}
