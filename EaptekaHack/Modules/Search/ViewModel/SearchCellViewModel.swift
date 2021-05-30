//
//  SearchCellViewModel.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/30/21.
//

import UIKit

struct SearchCellViewModel {
    let title: String
}

extension SearchCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? SearchViewCell else { return }
        
        cell.title.text = title
    }
}
