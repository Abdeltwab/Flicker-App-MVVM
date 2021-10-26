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
    case photoGallery(view:UIView, fetchSearchResults: BehaviorRelay<String?>)
}

//MARK: - PhotoGalleryContainerView

protocol PhotoGalleryContainerViewControllerProtocol {
    
    var viewModel: PhotoGalleryContainerViewModel?  { get }

}

//MARK: - PhotoGalleryViewModel

protocol PhotoGalleryContainerViewModelProtocol {
    var fetchSearchResults: BehaviorRelay<String?> {get}
    func showPhotosGallery(context:UIViewController,photosContainerView:UIView)
}

