//
//  SearchRequest.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

//import Foundation

//enum SearchRequest {
//    case search(search: String)
//}
//
//extension SearchRequest: ApiRequestType {
//
//    var shouldIncludeTokenInRequest: Bool { false }
//
//    var path: String {
//        switch self {
//        case .search:
//            return "search"
//        }
//    }
//
//    var method: HTTPMethod {
//        switch self {
//        case .search:
//            return .get
//        }
//    }
//
//    var headerFields: HTTPHeaders? {
//        nil
//    }
//
//    var parameters: [String: Any]? {
//        nil
//    }
//
//    var pageAttributes: String? {
//        switch self {
//        case let .search(search):
//            return "?q=\(search)"
//        }
//    }
//}

import Foundation

public enum StudentsApi {
    case students(search: String)
}

extension StudentsApi: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManagerStudents.environment {
        case .production:
            return "http://185.251.89.191/api/"
        case .qa:
            return ""
        case .staging:
            return ""
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .students(_):
            return "search"
    }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .students:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .students(let search):
            return .requestParametersAndHeaders(bodyParameters: nil,
                                                bodyEncoding: .urlEncoding,
                                                urlParameters: ["q": search],
                                                additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        nil
    }
}
