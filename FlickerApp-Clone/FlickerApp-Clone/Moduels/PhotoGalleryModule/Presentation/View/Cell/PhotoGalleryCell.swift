//
//  PhotoGalleryCell.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import UIKit
import Kingfisher

class PhotoGalleryCell: UICollectionViewCell {

    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        photoImgView.image = nil
        photoImgView.kf.cancelDownloadTask()
    }
    
}

extension PhotoGalleryCell{
    
    func setup(with photo:Photo){
        self.loadImage(url: photo.url)
    }
    
    func setupSkeletonCell(){
        self.activityIndicator.startAnimating()
    }
    
    private func loadImage(url: URL?){
        guard let url = url else {return}
        self.activityIndicator.stopAnimating()
        photoImgView.kf.setImage(with: url)
    }
}
