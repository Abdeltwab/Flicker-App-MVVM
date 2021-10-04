//
//  PhotoSearchProtocl.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import Foundation

protocol PhotoSearchProtocl {

    //MARK: - Methods

    func searchPhotos(text:String,completion: @escaping CallBacksTypeAliase.photoSearchResultCallback)
    
    //MARK: - Services
    
    var service: PhotoSearchService {get}

}

extension PhotoSearchProtocl {
    
    func searchPhotos(text:String,completion: @escaping CallBacksTypeAliase.photoSearchResultCallback) {
        service.serachPhotoByText(text) { result in
            switch result {
            case let .success(searchResuls):
                completion(.success(searchResuls))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private func test(){
        
    }
}

