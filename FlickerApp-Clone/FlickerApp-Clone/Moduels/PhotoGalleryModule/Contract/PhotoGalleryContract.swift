//
//  PhotoGalleryContract.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import RxSwift
import RxCocoa




protocol PhotoGalleryViewControllerProtocol {

    var viewModel: PhotoGalleryViewModel? { get }
    
}


protocol PhotoGalleryViewModelProtocol {

    var fetchSearchResults: BehaviorRelay<String?> {get}
    init(viewModel:PhotoGalleryContainerViewModelProtocol)
}
