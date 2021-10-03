//
//  Photo.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

struct Photo :Decodable {
    
    let id: String
    let title: URL

    enum CodingKeys: String, CodingKey {
        case id, title
    }
}

