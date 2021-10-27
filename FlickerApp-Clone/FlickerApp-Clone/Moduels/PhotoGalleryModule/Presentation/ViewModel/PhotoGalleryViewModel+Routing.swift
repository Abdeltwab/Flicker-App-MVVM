//
//  PhotoGalleryViewModel+Routing.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import UIKit

extension PhotoGalleryViewModel{
    
    func route (to route: PhotoGalleryRoute,
          from context: UIViewController){
        switch route {
        case  let .photoDetails(photo):
            let vc = PhotoDetailsViewController(nibName: "PhotoDetailsViewController", bundle: nil)
            vc.viewModel = PhotoDetailsViewModel(photo: photo)
            context.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
