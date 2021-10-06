//
//  PhotoDetailsContract.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import Foundation


// MARK: - PhotoDetailsViewController

protocol PhotoDetailsViewControllerProtocol {
    var viewModel: PhotoDetailsViewModel? { get }
}

// MARK: - PhotoDetailsViewModel

protocol PhotoDetailsViewModelProtocol {
    
    var photo: Photo {get set}
    init(photo:Photo)
}
