//
//  PhotoGalleryContainerContract.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import UIKit
import RxSwift
import RxCocoa


enum PhotoGalleryContainerRoute{
    case photoGallery(view:UIView,viewModel:PhotoGalleryContainerViewModel)
}

//MARK: - PhotoGalleryContainerView

protocol PhotoGalleryContainerViewControllerProtocol {
    
    var viewModel: PhotoGalleryContainerViewModel?  { get }

}

//MARK: - PhotoGalleryViewModel

protocol PhotoGalleryContainerViewModelProtocol {
    var searchText: BehaviorRelay<String?> {get}
    var fetchSearchResults: BehaviorRelay<String?> {get}
    func showPhotosGallery(context:UIViewController,photosContainerView:UIView)
}

