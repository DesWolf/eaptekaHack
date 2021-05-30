//
//  UIFont+Ext.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

extension UIFont {
    class var title: UIFont {
      return UIFont.systemFont(ofSize: 20.0, weight: .semibold)
    }
    
    class var subtitle: UIFont {
      return UIFont.systemFont(ofSize: 17.0, weight: .regular)
    }
    
    class var basic: UIFont {
      return UIFont.systemFont(ofSize: 15.0, weight: .regular)
    }
    
    class var basicIncreased: UIFont {
      return UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }
    
    class var basicIncreasedMedium: UIFont {
      return UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }
    
    class var price: UIFont {
      return UIFont.systemFont(ofSize: 18.0, weight: .regular)
    }
    
}


