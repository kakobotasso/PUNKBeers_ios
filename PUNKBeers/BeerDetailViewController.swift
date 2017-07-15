//
//  BeerDetailViewController.swift
//  PUNKBeers
//
//  Created by Kako Botasso on 15/07/17.
//  Copyright © 2017 Kako Botasso. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTagline: UILabel!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblAlcohol: UILabel!
    @IBOutlet weak var lblIbu: UILabel!
    @IBOutlet weak var ivPhoto: UIImageView!
    
    // MARK: - Properties
    var beer: Beer!
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        drawBeer()
    }
    
    // MARK: - Methods
    func drawBeer(){
        if let name = beer.name {
            lblName.text = name
        }
        
        if let tagline = beer.tagline {
            lblTagline.text = tagline
        }
        
        if let description = beer.description {
            txtDescription.text = description
        }
        
        if let alcohol = beer.abv {
            lblAlcohol.text = "\(alcohol)"
        }
        
        if let ibu = beer.ibu {
            lblIbu.text = "\(ibu)"
        }
        
        if let url = beer.imageUrl {
            loadImage(url)
        }
        
    }
    
    func loadImage(_ url: String){
        let api = RequestApi()
        api.requestPhoto(url: url) { response in
            self.ivPhoto.image = response 
        }
    }

}
