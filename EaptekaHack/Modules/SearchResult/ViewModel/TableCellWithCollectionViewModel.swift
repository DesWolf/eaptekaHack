//
//  CollectionSearchCellViewModel.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/29/21.
//

import UIKit

struct TableCellWithCollectionViewModel {
    weak var dataSource: TableCellWithCollectionDataSource?
    weak var delegate: TableCellWithCollectionDelegate?
    
}

extension TableCellWithCollectionViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? TableCellWithCollection else { return }
        cell.cellIndex = index
        cell.setupCollection(dataSource: dataSource, delegate: delegate)
    }
}
