//
//  SearchPhotos.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct Photos: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [Photo]
}
