//
//  CollectionCellViewModel.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/29/21.
//

import UIKit

struct CollectionCellViewModel {
    let name: String
    let reciptNeeded: Bool
    let price: Int
}

extension CollectionCellViewModel: SelfConfigurableViewModel {
    func configure(collectionCell: UICollectionViewCell, at index: IndexPath) {
        guard let cell = collectionCell as? CollectionCell else { return }
        
        cell.medName.text = name
        cell.reciept.isHidden = reciptNeeded
        cell.price.text = "\(price) ₽"
    }
}
