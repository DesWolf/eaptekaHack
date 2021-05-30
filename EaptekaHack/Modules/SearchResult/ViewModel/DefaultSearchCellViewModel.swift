//
//  SearchViewModel.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/29/21.
//

import UIKit

struct DefaultSearchCellViewModel {
    let name: String
    let substance: String
    let reciptNeeded: Bool
    let price: Int
    
}

extension DefaultSearchCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? DefaultSearchCell else { return }
        
        cell.medName.text = name
        cell.reciept.isHidden = reciptNeeded
        cell.price.text = "\(price) ₽"
        cell.substanceName.text = substance
    }
}
