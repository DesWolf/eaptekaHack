//
//  CollectionCell.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/29/21.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var medLogo: UIImageView!
    @IBOutlet weak var medName: UILabel!
    @IBOutlet weak var reciept: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cart: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .white
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        medLogo.image = #imageLiteral(resourceName: "medLogo")
        medName.numberOfLines = 2
        medName.set(font: .basicIncreased, color: .black)
        
        reciept.set(font: .basicIncreased, color: .bluePrimary)
        price.set(font: .price, color: .greenPrice)
        
        cart.setImage(#imageLiteral(resourceName: "cartButton"), for: .normal)
        
        cart.layer.cornerRadius = 24
        cart.backgroundColor = .bluePrimary
    }
}
