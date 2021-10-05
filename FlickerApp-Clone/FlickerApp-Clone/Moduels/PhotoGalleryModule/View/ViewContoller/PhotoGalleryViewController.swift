//
//  PhotoGalleryViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import UIKit

class PhotoGalleryViewController: UIViewController,PhotoGalleryViewControllerProtocol {
    
    var viewModel: PhotoGalleryViewModel?
        
    @IBOutlet weak var photoGalleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello from Gallery")
    }


}
