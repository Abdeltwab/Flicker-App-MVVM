//
//  EndPointProtocol.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation

protocol EndPointProtocol {
    
    var baseURL: String { get }

    var path: String { get }
    
    var httpMethod: HttpMethod { get }
        
    var task: Task { get }
    
    var request:URLRequest {get}
}


extension EndPointProtocol {
    
    var request: URLRequest {
        switch task {
        case .requestPlain:
            return URLRequest(url: createURL())
        case let .requestWithParameters(param):
            return URLRequest(url: createURL(params: param))
        }
    }
    
    func createURL(params: [String: String] = [:] ) -> URL {
        var components = URLComponents(string: baseURL)
        components?.queryItems?.append(URLQueryItem(name: "method", value: path))
        components?.queryItems = params.map { param in URLQueryItem(name: param.key, value: param.value) }
        return (components?.url)!
    }
}

enum HttpMethod:String {
    case get   = "GET"
    case post  = "POST"
}

enum Task {
    case requestPlain
    case requestWithParameters(param: [String:String])
}

