//
//  SearchPhotos.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct photoSearchResults: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photos: [Photo]
    
    
    enum CodingKeys: String, CodingKey{
        case page,pages,perpage,total
        case photos = "photo"
    }
}
