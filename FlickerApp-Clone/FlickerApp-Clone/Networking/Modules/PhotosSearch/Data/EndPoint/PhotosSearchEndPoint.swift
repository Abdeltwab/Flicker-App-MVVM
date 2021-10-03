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
        
    var httpMethod: HttpMethod {
        .get
    }
    
    var baseURL: String {
        return flickerBaseURL
    }
    
    var path: String {
        switch self {
        case .searhPhoto:
            return "flickr.photos.search"
        }
    }
    
    var task: Task {
        switch self {
        case let .searhPhoto(searchText):
            var parameters = commonParameters
            parameters["text"] = searchText
            return .requestWithParameters(param: parameters)
        }
    }    
}


