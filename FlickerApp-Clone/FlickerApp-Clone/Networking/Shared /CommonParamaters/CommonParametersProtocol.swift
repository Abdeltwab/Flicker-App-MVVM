//
//  CommonParametersProtocol.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import Foundation

protocol CommonParametersProtocol:ConstantsProtocol {
    var commonParameters: [String: String] { get }
}


extension CommonParametersProtocol {
    
    var commonParameters: [String: String] {
        return ["api_key": flickerApiKey ]
    }
    
}
