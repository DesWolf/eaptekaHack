//
//  FavoritesViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol FavoritesViewControllerType: AnyObject, PresentingView {
    var presenter: FavoritesPresenterType! { get set }
}

class FavoritesViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: FavoritesPresenterType!
    
    // MARK: - Private properties
    
    private let plug = UIImageView()
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plug.image = #imageLiteral(resourceName: "favorites")
        view.addSubview(plug)
        
        plug.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension FavoritesViewController: FavoritesViewControllerType {}
