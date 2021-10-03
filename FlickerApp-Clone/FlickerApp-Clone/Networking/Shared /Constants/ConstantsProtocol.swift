//
//  ConstantsProtocol.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation

protocol ConstantsProtocol {
    
    var apiKey : String {get}
    var apiSecret : String {get}
    var baseURL : String {get}
}

extension ConstantsProtocol {
    var apiKey:String {
        return APIConstant.apiKey.rawValue
    }
    
    var apiSecret:String {
        return APIConstant.apiSecret.rawValue
    }
    
    var baseURL:String {
        return APIConstant.baseURL.rawValue
    }
}
