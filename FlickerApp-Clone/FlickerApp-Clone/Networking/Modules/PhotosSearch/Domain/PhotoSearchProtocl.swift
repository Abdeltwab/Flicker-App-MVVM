//
//  PhotoSearchProtocl.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import RxSwift
import RxCocoa

protocol PhotoSearchProtocl {

    //MARK: - Methods

    func searchPhotos(text:String) -> Observable<(PhotoSearchResult?,Error?)>
    

    //MARK: - Services
    
    var service: PhotoSearchService {get}

}

extension PhotoSearchProtocl {
    
    func searchPhotos(text:String)-> Observable<(PhotoSearchResult?,Error?)> {
        
        return Observable.create { observer in
            service.serachPhotoByText(text) { result in
                switch result {
                case let .success(searchResuls):
                    observer.onNext((searchResuls,nil))
                case let .failure(error):
                    observer.onNext((nil,error))
                }
            }
            return Disposables.create()
        }
       
    }
    
    private func test(){
        
    }
}

