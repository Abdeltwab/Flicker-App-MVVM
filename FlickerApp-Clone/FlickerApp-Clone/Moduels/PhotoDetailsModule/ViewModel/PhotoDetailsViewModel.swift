//
//  PhotoDetailsViewModel.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import RxCocoa

final class PhotoDetailsViewModel:PhotoDetailsViewModelProtocol {
    
    let currentPhoto = BehaviorRelay<UIImage?>(value: nil)
    let fetchPhotoSizes = PublishRelay<Void>()
    
    var photo:Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
}

extension PhotoDetailsViewModel {
    
    private func getInitialPhoto(_ url:URL?){
        //TODO : get first iamge
    }
    
}
