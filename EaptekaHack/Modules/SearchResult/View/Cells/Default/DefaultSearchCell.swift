//
//  SearchCell.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/29/21.
//

import UIKit

protocol SearchCellDelegate: AnyObject {
    func didTap()
}

class DefaultSearchCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var medLogo: UIImageView!
    @IBOutlet weak var medName: UILabel!
    @IBOutlet weak var reciept: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var cart: UIButton!
    @IBOutlet weak var substance: UILabel!
    @IBOutlet weak var substanceName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .grayBackground
        background.backgroundColor = .white
        background.layer.cornerRadius = 8
        
        medLogo.image = #imageLiteral(resourceName: "medLogo")
        medName.numberOfLines = 2
        medName.set(font: .basicIncreased, color: .black)
        substanceName.set(font: .basicIncreasedMedium, color: .black)
        
        substance.set(text: Strings.Search.substance, font: .basicIncreased, color: .grayText)
        reciept.set(text: Strings.Search.cart ,font: .basicIncreased, color: .bluePrimary)
        price.set(font: .price, color: .greenPrice)
        
        price.semanticContentAttribute = .forceRightToLeft
        
        cart.setImage(#imageLiteral(resourceName: "cartButton"), for: .normal)
        cart.setTitle(Strings.Search.cart, for: .normal)
        cart.layer.cornerRadius = 24
        cart.backgroundColor = .bluePrimary
       
    }
}
