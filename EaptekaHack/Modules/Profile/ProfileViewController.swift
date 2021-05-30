//
//  ProfileViewController.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

protocol ProfileViewControllerType: AnyObject, PresentingView {
    var presenter: ProfilePresenterType! { get set }
}

class ProfileViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: ProfilePresenterType!
    
    // MARK: - Private properties
    
    private let plug = UIImageView()
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plug.image = #imageLiteral(resourceName: "profile")
        view.addSubview(plug)
        
        plug.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ProfileViewController: ProfileViewControllerType {}
