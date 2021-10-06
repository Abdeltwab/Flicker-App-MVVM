//
//  PhotoSearchResult.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct PhotoSearchResponse :Codable {
    
    let photoResults: photoSearchResults
    let status: String
    
    enum CodingKeys: String, CodingKey{
        case photoResults = "photos"
        case status = "stat"
    }
}

