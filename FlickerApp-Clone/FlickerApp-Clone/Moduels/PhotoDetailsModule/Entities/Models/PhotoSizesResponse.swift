//
//  PhotoSizes.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import Foundation

// MARK: - Welcome
struct PhotoSizesResponse: Codable {
    let sizes: PhotoSizesResults
    let status: String
    
    enum CodingKeys: String, CodingKey{
        case sizes
        case status = "stat"
    }
}
