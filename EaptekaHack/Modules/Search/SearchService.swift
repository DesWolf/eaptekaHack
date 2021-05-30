//
//  SearchService.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/28/21.
//

import Foundation

protocol SearchServiceType {
    var search: String { get set }
    func load(completion: @escaping (MedsResponce?) -> Void)
}

class SearchService {
//    let network = NetworkProvider<SearchRequest>()
    let network = NetworkManagerStudents()
    var search: String = ""
    
}

extension SearchService: SearchServiceType {
//    typealias ItemType = Search
    
    
    
    func load(completion: @escaping (MedsResponce?) -> Void) {
        
        network.fetchStudentsList(search: search) { result, error in
            completion(result)
        }
        
        
        
//        network.perform(request: .search(search: search)) { (result: Result<MedsResponce, NetworkError>) in
//            switch result {
//            case .success(let response):
//                completion(.success(response))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
    }
//    func load(page: Int, pageSize: Int, completion: @escaping (Result<([Weather], Int), Error>) -> Void) -> CancellableRequest? {
//        return network.perform(request: .search(city: text, page: page, pageSize: pageSize)) { (result: Result<WeatherResponseItem, NetworkError>) in
//            switch result {
//            case let .success(responseItem):
//                let weather = responseItem.weather
//                completion(.success((weather, responseItem.unwrappedCount)))
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
}
