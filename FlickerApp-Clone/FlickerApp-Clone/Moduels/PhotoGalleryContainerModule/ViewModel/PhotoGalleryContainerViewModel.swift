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
    
    
    let disposeBag = DisposeBag()
    let fetchSearchResults = BehaviorRelay<String?>(value: "Cat")

     
    init() {
        //self.configureBinding()
    }
}


extension PhotoGalleryContainerViewModel {
    
   
    
//    private func didPressRetunrnInSearchBar(){
//        fetchSearchResults
//            .filter{ $0 != nil}
//            .filter{ !$0!.isEmpty}.map{$0!}
//            .subscribe(onNext: { text in
//                print(text)
//            })
//            .disposed(by: disposeBag)
//    }

    
}
