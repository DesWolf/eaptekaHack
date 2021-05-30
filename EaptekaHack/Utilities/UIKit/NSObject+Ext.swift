//
//  NSObject+Ext.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/29/21.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
