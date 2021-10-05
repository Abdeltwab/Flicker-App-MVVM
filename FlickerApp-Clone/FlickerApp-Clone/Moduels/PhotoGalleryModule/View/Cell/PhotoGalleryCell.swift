//
//  PhotoGalleryCell.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import UIKit

class PhotoGalleryCell: UICollectionViewCell {

    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
}

extension PhotoGalleryCell{
    
    func setup(with photo:Photo){
        self.loadImage(urlString: "dumy URL")
    }
    
    func setupSkeletonCell(){
        self.photoImgView.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    private func loadImage(urlString: String){
        guard let url = URL(string: urlString) else {return}
        //TODO: -  laod image here
    }
}
