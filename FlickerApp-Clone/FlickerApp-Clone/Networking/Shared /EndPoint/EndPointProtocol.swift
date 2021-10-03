//
//  EndPointProtocol.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation

protocol EndPointProtocol {
    
    var baseURL: URL { get }

    var path: String { get }

    var httpMethod: HttpMethod { get }
    
    var request: URLRequest { get }
    
//    var requestType: RequestType { get }

}



enum HttpMethod:String {
    case get   = "GET"
    case post  = "POST"
}

