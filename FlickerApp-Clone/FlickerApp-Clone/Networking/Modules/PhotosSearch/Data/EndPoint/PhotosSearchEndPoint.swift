//
//  PhotosSearchEndPoint.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation

enum PhotosSearchEndPoint {
    case searhPhoto(searchText:String)
}

extension PhotosSearchEndPoint:EndPointProtocol,ConstantsProtocol ,CommonParametersProtocol {
    
    var baseURL: URL {
        return flickerBaseURL
    }
    
    var path: String {
        switch self {
        case .searhPhoto:
            return "flickr.photos.search"
        }
    }
    
    var request: URLRequest {
        switch self {

        case let .searhPhoto(searchText):
            var parameters = commonParameters
            parameters["text"] = searchText
            return URLRequest(url: URL(string: "")!)
            
        }
    }
    
}


enum requestType {
    case requestPlain
}

