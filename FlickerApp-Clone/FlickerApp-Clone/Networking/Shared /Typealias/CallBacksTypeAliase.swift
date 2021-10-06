//
//  callbacksTypealias.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation


enum CallBacksTypeAliase {
    typealias photoSearchResultCallback = ((Result<PhotoSearchResponse, Error>) -> Void)
    typealias photoSizesResponseCallback = ((Result<PhotoSizesResponse, Error>) -> Void)

}
