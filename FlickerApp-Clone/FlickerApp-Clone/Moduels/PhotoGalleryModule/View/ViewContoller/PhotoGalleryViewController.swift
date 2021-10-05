//
//  PhotoGalleryViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 05/10/2021.
//

import UIKit
import RxSwift
import RxCocoa

class PhotoGalleryViewController: UIViewController,PhotoGalleryViewControllerProtocol, UIScrollViewDelegate {
    
    var viewModel: PhotoGalleryViewModel?
    private let disposeBag = DisposeBag()
        
    @IBOutlet weak var photoGalleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello from Gallery")
        configureCollectionView()
    }
}

//MARK: Collection View configuration

extension PhotoGalleryViewController {
    
    private func configureCollectionView(){
        registerCollectionViewCell()
        setupCollectionViewFlowLayout()
        photoGalleryCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    private func registerCollectionViewCell() {
        let nib = UINib(nibName: "\(PhotoGalleryCell.self)", bundle: nil)
        photoGalleryCollectionView.register(nib, forCellWithReuseIdentifier: "\(PhotoGalleryCell.self)")
    }
    
    private func setupCollectionViewFlowLayout() {
        photoGalleryCollectionView.collectionViewLayout.invalidateLayout()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 2
        flowLayout.scrollDirection = .vertical
        //TODO : Fix this
        let cellHeight = CGFloat(270)
        let cellWidth = ((UIScreen.main.bounds.width - 20) / CGFloat(2) )
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        photoGalleryCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
}
