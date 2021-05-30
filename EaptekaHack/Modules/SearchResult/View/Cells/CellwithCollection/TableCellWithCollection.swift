//
//  CollectionSearchCell.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/29/21.
//

import UIKit

protocol TableCellWithCollectionDelegate: AnyObject {
}

protocol TableCellWithCollectionDataSource: AnyObject {
    func numberOfItems(at cellIndex: IndexPath) -> Int
    func item(at cellIndex: IndexPath, at index: Int) -> SelfConfigurableViewModel
    func selectItem(at cellIndex: IndexPath, at index: Int)
}

class TableCellWithCollection: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var chevron: UIImageView!
    
    private unowned var dataSource: TableCellWithCollectionDataSource!
    private unowned var delegate: TableCellWithCollectionDelegate!
    
    var cellIndex: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }

    
    private func setupViews() {
        setGradientBackground()
        selectionStyle = .none
        
        titleLabel.text = Strings.Search.analogTitle
        subtitleLabel.text = Strings.Search.analogSubtitle
        titleLabel.set(font: .title, color: .white)
        subtitleLabel.set(font: .subtitle, color: .white)
        subtitleLabel.numberOfLines = 0
        
        chevron.image = #imageLiteral(resourceName: "chevron")
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor.gradientColorTop.cgColor
        let colorBottom = UIColor.gradientColorBottom.cgColor
                    
        let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorBottom, colorTop]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.contentView.bounds
            
        background.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setupCollection(dataSource: TableCellWithCollectionDataSource?, delegate: TableCellWithCollectionDelegate?) {
        collection.register(UINib(nibName: CollectionCell.className, bundle: nil), forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
        self.dataSource = dataSource
        self.delegate = delegate
        
        collection.reloadData()
    }
    
}


extension TableCellWithCollection: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 226, height: 256)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfItems(at: cellIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.reuseIdentifier, for: indexPath)
        let viewModel = dataSource.item(at: cellIndex, at: indexPath.item)
        viewModel.configure(collectionCell: cell, at: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        dataSource.selectItem(at: cellIndex, at: indexPath.item)
    }
}
