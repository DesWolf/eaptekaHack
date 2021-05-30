//
//  UIView+Ext.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
