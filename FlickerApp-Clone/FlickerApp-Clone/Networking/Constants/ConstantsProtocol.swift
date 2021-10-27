//
//  ConstantsProtocol.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation

protocol ConstantsProtocol {
    
    var flickerApiKey : String {get}
    var flickerApiSecret : String {get}
    var flickerBaseURL : String {get}
}

extension ConstantsProtocol {
    var flickerApiKey:String {
        return APIConstant.flickerApiKey.rawValue
    }
    
    var flickerApiSecret:String {
        return APIConstant.flickerApiSecret.rawValue
    }
    
    var flickerBaseURL:String {
        return APIConstant.flickerBaseURL.rawValue
    }
}
