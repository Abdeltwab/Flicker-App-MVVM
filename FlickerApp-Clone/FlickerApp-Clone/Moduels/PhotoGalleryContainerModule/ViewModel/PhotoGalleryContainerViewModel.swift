//
//  PhotoGalleryContainerViewModel.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import RxSwift
import RxCocoa

class PhotoGalleryContainerViewModel:PhotoGalleryContainerViewModelProtocol {    
    
    private let disposeBag = DisposeBag()
    let fetchSearchResults = BehaviorRelay<String?>(value: "Cat")

}


// MARK: - Navigation

extension PhotoGalleryContainerViewModel {
    
    func showPhotosGallery(context:UIViewController,photosContainerView:UIView){
        self.route(to: .photoGallery(view: photosContainerView, fetchSearchResults: self.fetchSearchResults), from: context)
    }
}
