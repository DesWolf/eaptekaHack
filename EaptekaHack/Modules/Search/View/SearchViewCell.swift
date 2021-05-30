//
//  SearchViewCell.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/30/21.
//

import UIKit

class SearchViewCell: UITableViewCell {
  
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupViews()
    }
    
    private func setupViews() {
        title.set(font: .basic, color: .black)
    }
}
