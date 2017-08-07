//
//  BeerTableViewCell.swift
//  PUNKBeers
//
//  Created by Kako Botasso on 15/07/17.
//  Copyright © 2017 Kako Botasso. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAlcohol: UILabel!
    
    // MARK: - Super Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    func drawBeer(_ beer: Beer){
        
        if let url = beer.imageUrl {
            loadImage(url);
        }
        
        if let name = beer.name {
            lblDescription.text = name
        }
        
        if let alcohol = beer.abv {
            lblAlcohol.text = "Teor Alcoólico: \(alcohol)"
        }
    }
    
    func loadImage(_ url: String){
        let api = RequestApi()
        api.requestPhoto(url: url) { response in
            DispatchQueue.main.async {
                self.ivPhoto.image = response
            }
        }
    }

}
