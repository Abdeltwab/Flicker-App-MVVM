//
//  PhotoGalleryContainerViewModel+Routing.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import UIKit

extension PhotoGalleryContainerViewModel{
    
    func route (to route: PhotoGalleryContainerRoute,
          from context: UIViewController){
        switch route {
        case  .photoGallery(let view ,let fetchSearchResults):
            let vc = PhotoGalleryViewController(nibName: "PhotoGalleryViewController", bundle: nil)
            vc.viewModel = PhotoGalleryViewModel(fetchSearchResults: fetchSearchResults)
            context.add(child: vc, at: view)
        }
    }
}


extension UIViewController {
    func add(child: UIViewController, at containerView: UIView, atFront: Bool = true) {
        addChild(child)
        containerView.addSubview(child.view)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        child.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        child.didMove(toParent: self)
    }
}
