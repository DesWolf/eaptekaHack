//
//  String+Ext.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/30/21.
//

import UIKit
extension String{
    var encodeUrl : String
    {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var decodeUrl : String
    {
        return self.removingPercentEncoding!
    }
}
