//
//  MockPhotoGalleryUseCases.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 27/10/2021.
//

import RxCocoa
import RxSwift


class MockPhotoGalleryUseCases : PhotoSearchProtocl {
    
    let service = PhotoSearchService() //need to rething of it

    func searchPhotos(text:String , completion: @escaping (PhotoSearchResponse?, Error?) -> Void){
        
        // TODO
         /*
          -  this should utlize the mock json file
          -  retunrn results
         */
       
    }
    
}
