//
//  SelfConfigurableViewModel.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath)
    func configure(collectionCell: UICollectionViewCell, at index: IndexPath)
    func configure(view: UITableViewHeaderFooterView, in section: Int)
    func configure(view: UIView)
}

extension SelfConfigurableViewModel {
    
    func configure(tableCell: UITableViewCell, at index: IndexPath) {}
    func configure(collectionCell: UICollectionViewCell, at index: IndexPath) {}
    func configure(view: UITableViewHeaderFooterView, in section: Int) {}
    func configure(view: UIView) {}
}
