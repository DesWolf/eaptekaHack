//
//  CatalogCellViewModel.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

struct CatalogCellViewModel {
    let title: String
    
}

extension CatalogCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? CatalogCell else { return }
        
        cell.accessoryType = .disclosureIndicator
        cell.title.text = title
    }
}
