//
//  PhotoDetailsContract.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import RxCocoa


// MARK: - PhotoDetailsViewController

protocol PhotoDetailsViewControllerProtocol {
    var viewModel: PhotoDetailsViewModel? { get }
}

// MARK: - PhotoDetailsViewModel

protocol PhotoDetailsViewModelProtocol {
    
    var fetchPhotoSizes: PublishRelay<Void> {get}
    var currentPhoto : BehaviorRelay<UIImage?> {get}

    var photo: Photo {get set}
    init(photo:Photo)
}
