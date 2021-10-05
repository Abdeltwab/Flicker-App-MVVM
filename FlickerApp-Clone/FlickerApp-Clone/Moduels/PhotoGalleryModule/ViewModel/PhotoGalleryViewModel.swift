//
//  PhotoGalleryViewModel.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import RxCocoa
import RxSwift

final class PhotoGalleryViewModel :PhotoGalleryViewModelProtocol {
    
    private let disposeBag = DisposeBag()
    var fetchSearchResults : BehaviorRelay<String?>
    
    init(viewModel:PhotoGalleryContainerViewModelProtocol) {
        fetchSearchResults = viewModel.fetchSearchResults
        self.configureBinding()
    }
    
}


extension PhotoGalleryViewModel {
    
    private func configureBinding(){
        fetchSearchResults
            .filter{ $0 != nil}
            .filter{ !$0!.isEmpty}.map{$0!}
            .subscribe(onNext: { text in
                print(text)
            })
            .disposed(by: disposeBag)
    }
}
