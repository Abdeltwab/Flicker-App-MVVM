//
//  PhotoSearchResult.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct PhotoSearchResult :Decodable {
    
    let status: String?
    let photos: Photos?

    enum CodingKeys: String, CodingKey {
        case status = "stat"
        case photos
    }
}

