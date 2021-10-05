//
//  PhotoGalleryContainerViewModel.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import RxSwift
import RxCocoa

class PhotoGalleryContainerViewModel:PhotoGalleryContainerViewModelProtocol {
    let searchText = BehaviorRelay<String?>(value: "")
    
    
    private let disposeBag = DisposeBag()
    let fetchSearchResults = BehaviorRelay<String?>(value: "Cat")

     
    init() {
        //self.configureBinding()
    }
}


extension PhotoGalleryContainerViewModel {
    
   
    


    
}
