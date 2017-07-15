//
//  RequestApi.swift
//  PUNKBeers
//
//  Created by Kako Botasso on 15/07/17.
//  Copyright © 2017 Kako Botasso. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class RequestApi {
    
    // MARK: - Properties
    let network = NetworkApi()
    var cities : [Beer] = []
    
    // MARK: - Methods
    func requestBeers(completionHandler : @escaping ([Beer]) -> Void){
        Alamofire.request(network.URL).responseArray { (response: DataResponse<[Beer]>) in
            let beerApiResponse = response.result.value
            
            guard let apiResponse = beerApiResponse else{
                return
            }
            
            completionHandler(apiResponse)
        }
    }
    
}
