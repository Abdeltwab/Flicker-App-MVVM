//
//  PhotoSizesProtocol.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import RxSwift
import RxCocoa

protocol PhotoSizesProtocol {

    //MARK: - Methods

    func getPhotoSizes(id:String) -> Observable<(PhotoSizesResponse?,Error?)>

    //MARK: - Services
    
    var service: PhotoSizesService {get}

}

extension PhotoSizesProtocol {
    
    func getPhotoSizes(id:String) -> Observable<(PhotoSizesResponse?,Error?)> {
        
        return Observable.create { observer in
            service.getPhotoSizeby(id:id) { result in
                switch result {
                case let .success(sizesResponse):
                    observer.onNext((sizesResponse,nil))
                case let .failure(error):
                    observer.onNext((nil,error))
                }
            }
            return Disposables.create()
        }
    }
}
