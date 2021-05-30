//
// SearchResultView.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit
import SnapKit
    
final class SearchResultView: UIView {

    // MARK: - Private properties

    let topView = UIView()
    
    let backButton = UIButton()
    let photoButton = UIButton()
    
    let sortButton = UIButton()
    let filterButton = UIButton()
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    // MARK: - Initializers

    init() {
        super.init(frame: .zero)

        setupViews()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    // MARK: - Private methods

    private func setupViews() {
        UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.basic
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.basic

        topView.backgroundColor = .whiteBackground
        tableView.backgroundColor = .whiteBackground
        
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .bluePrimaryLight
        searchBar.backgroundColor = .clear
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.bluePrimary
        searchBar.placeholder = Strings.SearchBar.placeholder

        searchBar.setImage(#imageLiteral(resourceName: "searchButton"), for: .search, state: .normal)
        searchBar.setImage(#imageLiteral(resourceName: "closeButton"), for: .clear, state: .normal)
       
        photoButton.setImage(#imageLiteral(resourceName: "photoButton"), for: .normal)
        backButton.setImage(#imageLiteral(resourceName: "backButton"), for: .normal)
        
        filterButton.setImage(#imageLiteral(resourceName: "filterButton"), for: .normal)
        filterButton.setTitle(Strings.Search.filter, for: .normal)
        filterButton.set(font: .basic, color: .bluePrimary)
        
        
        sortButton.setImage(#imageLiteral(resourceName: "sortButton"),for: .normal)
        sortButton.setTitle(Strings.Search.sort, for: .normal)
        sortButton.set(font: .basic, color: .bluePrimary)
        
        tableView.separatorColor = .clear
        tableView.backgroundColor = .grayBackground
        
        addSubview(topView)
        topView.addSubview(searchBar)
        topView.addSubview(backButton)
    
        topView.addSubview(sortButton)
        topView.addSubview(filterButton)

        searchBar.addSubview(photoButton)
        
        addSubview(tableView)
    }
    
    
    private func setConstraints() {
        topView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(179)
        }
        
        backButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(15)
            $0.centerY.equalTo(searchBar.snp.centerY)
        }

        searchBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.right.equalToSuperview().inset(15)
            $0.left.equalTo(backButton.snp.right).offset(15)
        }
        
        sortButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.top.equalTo(searchBar.snp.bottom).offset(25)
        }
        
        filterButton.snp.makeConstraints {
            $0.left.equalTo(sortButton.snp.right).offset(20)
            $0.top.equalTo(searchBar.snp.bottom).offset(25)
        }
        
        photoButton.snp.makeConstraints {
            $0.right.equalTo(searchBar.snp.right).inset(15)
            $0.centerY.equalTo(searchBar.snp.centerY)
        }
       
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}
