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
    let service = PhotoSearchService()

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
            .flatMap({ [weak self] query -> Observable<(PhotoSearchResult?, Error?)> in
                guard let self = self else {return Observable.empty()}
                return self.searchPhotos(text: query)
            })
            .bind(onNext: { [weak self] res,err in
                guard let self = self else {return}
                guard err == nil else {
                    return
                }
                print(res?.photos)
            })
            .disposed(by: disposeBag)
    }
}
