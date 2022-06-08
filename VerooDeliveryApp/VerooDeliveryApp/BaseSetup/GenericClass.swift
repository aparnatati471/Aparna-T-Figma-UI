//
//  GenericClass.swift
//  VerooDeliveryApp
//
//  Created by Aparna Tati on 08/06/22.
//

import Foundation
import Alamofire

enum APIs {
    case login
    case register
}

protocol UrlEncoding: Codable {
    
    var path: String { get }
    var base_url: String { get }
    var url: URL { get }
    var httpMethod: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    
}

extension APIs: UrlEncoding {
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .register:
            return "register"
        }
    }
    
    var base_url: String {
        switch self {
        case .login, .register:
            return "https://reqres.in/api/"
        }
    }
    
    var url: URL {
        switch self {
            default: return URL(string: self.base_url + self.path)!
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .register:
            return .post
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login, .register:
            return URLEncoding.default
        }
    }
    
}

class GenericClass {
    
    static let shared = GenericClass()
    
    private init(){}

    func request<T: Decodable>(typeT: T.Type, type: APIs, parameters: [String: Any]?, completion: @escaping (T?, Int) -> Void, failure: @escaping (Int, String) -> Void) {
        AF.request(type.url, method: type.httpMethod, parameters: parameters, encoding: type.encoding, headers: nil, interceptor: nil, requestModifier: nil).response { response in
            switch response.result {
                case .success(let data):
                print("Reached")
                    guard let responseData = data else {
                        completion(nil, response.response?.statusCode ?? 0)
                        return
                    }
                    do {
                        guard let jsonData = try JSONDecoder().decode(T?.self, from: responseData) else { return }
                        print("Response Code: \(String(describing: response.response?.statusCode))")
                        completion(jsonData, response.response?.statusCode ?? 0)
                    } catch let error {
                        failure(response.response?.statusCode ?? 0, error.localizedDescription)
                    }
                    break
                
                case .failure(let error):
                    print(error)
                    break
            }
        }
    }
    
}
