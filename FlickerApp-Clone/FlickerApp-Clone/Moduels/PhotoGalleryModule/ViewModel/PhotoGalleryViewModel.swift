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
    let dataSource =  BehaviorRelay<[PhotoUIModel]>(value: [])

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
                self.addSkeletonCells()
                return self.searchPhotos(text: query)
            })
            .bind(onNext: { [weak self] res,err in
                guard let self = self else {return}
                guard err == nil ,
                      let res = res else {
                    return
                }
                self.handleSucessPhotoFetching(res: res)
            })
            .disposed(by: disposeBag)
    }
    
    
    private func handleSucessPhotoFetching(res:PhotoSearchResult){
        self.deleteSkeletonCells()
        //TODO : Handle sucess fetch here
        //temp for testing
        self.addSkeletonCells(count: res.photos.total)
    }
    
    private func addSkeletonCells(count:Int = 10){
        let skeltonCellCount = count
        var result = self.dataSource.value
        var skeltonArray:[PhotoUIModel] = []
        for _ in 1...skeltonCellCount {
            skeltonArray.append(PhotoUIModel.skeleton)
        }
        result.append(contentsOf: skeltonArray)
        self.dataSource.accept(result)
    }
    
    private func deleteSkeletonCells() {
        var result = self.dataSource.value
        result = result.filter{ $0 != .skeleton}
        self.dataSource.accept(result)
    }

}
