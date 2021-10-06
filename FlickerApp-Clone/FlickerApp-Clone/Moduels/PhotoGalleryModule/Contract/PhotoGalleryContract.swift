//
//  PhotoGalleryContract.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import RxCocoa
import RxSwift

enum PhotoGalleryRoute {
    case photoDetails(photo: Photo)
}

// MARK: - PhotoGalleryViewController

protocol PhotoGalleryViewControllerProtocol {
    var viewModel: PhotoGalleryViewModel? { get }
}

// MARK: - PhotoGalleryViewModel

protocol PhotoGalleryViewModelProtocol: PhotoSearchProtocl {
    var fetchSearchResults: BehaviorRelay<String?> { get }
    var dataSource: BehaviorRelay<[PhotoUIModel]> { get }

    init(viewModel: PhotoGalleryContainerViewModelProtocol)
    func navigateToPhotoDetails(context: UIViewController, photo: Photo)
}
