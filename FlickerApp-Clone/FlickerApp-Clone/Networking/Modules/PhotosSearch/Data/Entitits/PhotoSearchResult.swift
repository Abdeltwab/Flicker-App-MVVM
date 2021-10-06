//
//  PhotoSearchResult.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct PhotoSearchResult :Codable {
    
    let photos: Photos
    let status: String
    
    enum CodingKeys: String, CodingKey{
        case photos
        case status = "stat"
    }
}

