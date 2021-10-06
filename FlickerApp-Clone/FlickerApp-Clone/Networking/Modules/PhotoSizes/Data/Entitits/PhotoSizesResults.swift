//
//  PhotoSizesResults.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//


// MARK: - Sizes
struct PhotoSizesResults: Codable {
    let canblog, canprint, candownload: Int
    let sizes: [PhotoSize]
    
    
    enum CodingKeys: String, CodingKey{
        case canblog, canprint, candownload
        case sizes = "size"
    }
}
