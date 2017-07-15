//
//  Beer.swift
//  PUNKBeers
//
//  Created by Kako Botasso on 15/07/17.
//  Copyright © 2017 Kako Botasso. All rights reserved.
//

import Foundation
import ObjectMapper

class Beer : Mappable{
    
    // MARK: - Properties
    var id: Int?
    var name: String?
    var tagline: String?
    var firstBrewed: String?
    var description: String?
    var imageUrl: String?
    var abv: Double?
    var ibu: Double?
    var targetFg: Double?
    var targetOg: Double?
    var ebc: Double?
    var srm: Double?
    var ph: Double?
    var attenuationLevel: Double?
    
    // MARK: - Initializers
    required init?(map: Map) {}
    
    // MARK: - Methods
    func mapping(map: Map){
        id <- map["id"]
        name <- map["name"]
        tagline <- map["tagline"]
        firstBrewed <- map["first_brewed"]
        description <- map["description"]
        imageUrl <- map["image_url"]
        abv <- map["abv"]
        ibu <- map["ibu"]
        targetFg <- map["target_fg"]
        targetOg <- map["target_og"]
        ebc <- map["ebc"]
        srm <- map["srm"]
        ph <- map["ph"]
        attenuationLevel <- map["attenuation_level"]
    }
}
