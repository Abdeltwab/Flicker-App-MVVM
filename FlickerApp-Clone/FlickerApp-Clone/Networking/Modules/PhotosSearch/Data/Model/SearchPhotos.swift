//
//  SearchPhotos.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct Photos: Decodable {
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [Photo]
    let total: String
    
    enum CodingKeys: String, CodingKey {
        case page
        case pages
        case perpage
        case photo
        case total
    }
    
}
