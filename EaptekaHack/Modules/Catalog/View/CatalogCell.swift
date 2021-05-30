//
//  CatalogCell.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol FilmInfoTableCellDelegate: AnyObject {
    func didTap()
}

class CatalogCell: UITableViewCell {
    let title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: CatalogCell.reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupViews() {
        backgroundColor = .grayBackground
        selectionStyle = .none
        
        contentView.addSubview(title)
    }
    
    private func setupConstraints() {
        title.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
    }
}
