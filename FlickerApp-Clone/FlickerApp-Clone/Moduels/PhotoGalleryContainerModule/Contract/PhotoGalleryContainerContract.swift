//
//  PhotoGalleryContainerContract.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import Foundation
import UIKit


enum PhotoGalleryContainerRoute{
    case photoGallery(view:UIView)
}


protocol PhotoGalleryContainerViewControllerProtocol {
    
    var viewModel: PhotoGalleryContainerViewModel?  { get }

}
