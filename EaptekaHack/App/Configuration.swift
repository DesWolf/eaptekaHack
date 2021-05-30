//
//  Configuration.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import UIKit

struct Configuration {

    static let domain = "http://185.251.89.191"// dev
    //    static let domain = "" //  test
    //    static let domain = "" // prod
    static let apiBaseUrl = "\(domain)/api/"
//    static let token = "5413b464dd02b162651d5d7f9c6f7174"
    static let requestTimeoutInterval: TimeInterval = 30

}

extension TimeInterval {
    static let defaultAnimDuration: TimeInterval = 0.3
    static let fastAnimDuration: TimeInterval = 0.15
}
