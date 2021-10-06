//
//  Photo.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct Photo: Codable {
    let id, secret, server: String
    let title: String
}


extension Photo{
    var url:URL?{
        return URL(string: APIConstant.flickerImageBaseURL.rawValue+"\(server)/"+"\(id)_\(secret).jpg")!
    }
}


