//
//  CartViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol CartViewControllerType: AnyObject, PresentingView {
    var presenter: CartPresenterType! { get set }
}

class CartViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: CartPresenterType!
    
    // MARK: - Private properties
    
    private let plug = UIImageView()
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plug.image = #imageLiteral(resourceName: "cart")
        view.addSubview(plug)
        
        plug.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CartViewController: CartViewControllerType {}
