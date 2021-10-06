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
        let photosUIModels = self.mapToPhotoUIModel(res: res)
        self.dataSource.accept(photosUIModels)

    }
    
    private func addSkeletonCells(){
        let skeltonCellCount = 10
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
    
    private func mapToPhotoUIModel(res:PhotoSearchResult) -> [PhotoUIModel]{
       return res.photos.photo.compactMap { PhotoUIModel.item($0)}
    }

}
