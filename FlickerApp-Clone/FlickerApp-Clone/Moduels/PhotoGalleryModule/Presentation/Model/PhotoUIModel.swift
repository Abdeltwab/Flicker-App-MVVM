//
//  PhotoUIModel.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//


enum PhotoUIModel {
    case item(_ photo:Photo)
    case skeleton
}


extension PhotoUIModel: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.item, .item):
            return true
        case (.skeleton, .skeleton):
            return true
        default:
            return false
        }
    }
}
