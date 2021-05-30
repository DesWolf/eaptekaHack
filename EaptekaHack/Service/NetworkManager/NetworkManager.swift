//
//  NetworkManager.swift
//  EaptekaHack
//
//  Created by Максим Окунеев on 5/30/21.
//

import UIKit

enum NetworkEnvironment {
    case qa
    case production
    case staging
}

enum NetworkResponse:String {
    case success = "200-299 Sucsess"
    case incorrectAPI = "403 incorrect API"
    case dataError = "400 Send data Error"
    case incorrectToken = "401 Token incorrect"
    case dataNotFound = "404-500 Data not found"
    case badRequest = "501-509 Bad request"
    case outdated = "600 The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success(String)
    case failure(String)
}

struct NetworkManagerStudents {
    static let environment : NetworkEnvironment = .production
    private let router = Router<StudentsApi>()


    func fetchStudentsList(search: String, completion: @escaping (_ contacts: MedsResponce?,_ error: String?)->()){
        router.request(.students(search: search)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(MedsResponce.self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success(NetworkResponse.success.rawValue)
        case 400: return .success(NetworkResponse.dataError.rawValue)
        case 403: return .success(NetworkResponse.incorrectAPI.rawValue)
        case 404...500: return .failure(NetworkResponse.dataNotFound.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
