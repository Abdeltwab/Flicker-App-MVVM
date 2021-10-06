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
        setupUIBinding()
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
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 3
        flowLayout.scrollDirection = .vertical
        //TODO : Fix this
        let cellHeight = CGFloat(270)
        let cellWidth = ((UIScreen.main.bounds.width - 20) / CGFloat(2) )
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        photoGalleryCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
}


//MARK: UI Binding

extension PhotoGalleryViewController {
    
    private func setupUIBinding(){
        bindCollectionViewSelection()
        bindCollectionViewDataSource()
    }
    
    private func bindCollectionViewDataSource(){
        guard let viewModel = self.viewModel else {return}
        viewModel.dataSource
            .bind(to: photoGalleryCollectionView.rx.items) { collectionView, index, item in
                let indexPath = IndexPath(row: index, section: 0)
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoGalleryCell.self)", for: indexPath) as? PhotoGalleryCell ?? PhotoGalleryCell()
                switch item {
                case .item(let photo):
                    cell.setup(with: photo)
                    return cell
                case .skeleton:
                    cell.setupSkeletonCell()
                    return cell
                }
            }.disposed(by: disposeBag)
    }
    
    private func bindCollectionViewSelection(){
        photoGalleryCollectionView.rx
            .modelSelected(PhotoUIModel.self)
            .bind(onNext: { item in
                switch item{
                case let .item(photo):
                    guard let viewModel = self.viewModel else {return}
                    viewModel.navigateToPhotoDetails(context: self, photo: photo)
                case .skeleton:break
                }
            }).disposed(by: disposeBag)
    }
}
