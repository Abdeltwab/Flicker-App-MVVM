//
//  PhotoSizesEndPoint.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import Foundation


enum PhotoSizesEndPoint {
    case getPhotoSizes(id:String)
}

extension PhotoSizesEndPoint:EndPointProtocol,ConstantsProtocol ,CommonParametersProtocol {
        
    var httpMethod: HttpMethod {
        .get
    }
    
    var baseURL: String {
        return flickerBaseURL
    }
    
    var path: String {
        switch self {
        case .getPhotoSizes:
            return "flickr.photos.getSizes"
        }
    }
    
    var task: Task {
        switch self {
        case let .getPhotoSizes(id):
            var parameters = commonParameters
            parameters["photo_id"] = id
            return .requestWithParameters(param: parameters)
        }
    }
}


