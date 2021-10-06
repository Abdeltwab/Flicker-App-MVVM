//
//  PhotoDetailsViewModel.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import RxCocoa
import Kingfisher

final class PhotoDetailsViewModel:PhotoDetailsViewModelProtocol {
    
    let currentPhoto = BehaviorRelay<UIImage?>(value: nil)
    let fetchPhotoSizes = PublishRelay<Void>()
    
    var photo:Photo
    
    init(photo: Photo) {
        self.photo = photo
        self.setInitialPhoto(photo.url)
    }
}

extension PhotoDetailsViewModel {
    
    private func setInitialPhoto(_ url:URL?){
        guard let url = url else {return}
        KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                self.currentPhoto.accept(value.image)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
}
