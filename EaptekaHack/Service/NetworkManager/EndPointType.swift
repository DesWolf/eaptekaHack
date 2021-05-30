//
//  EndPointType.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/30/21.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
