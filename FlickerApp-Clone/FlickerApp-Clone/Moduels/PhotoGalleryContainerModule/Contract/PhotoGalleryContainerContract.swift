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
    case photoGallery(view:UIView)
}


protocol PhotoGalleryContainerViewControllerProtocol {
    
    var viewModel: PhotoGalleryContainerViewModel?  { get }

}

//MARK: - ViewModel
protocol PhotoGalleryContainerViewModelProtocol {
    var searchText: BehaviorRelay<String> {get}
}

