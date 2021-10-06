//
//  PhotoDetailsViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import UIKit
import RxCocoa
import RxSwift

class PhotoDetailsViewController: UIViewController ,PhotoDetailsViewControllerProtocol {
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var getPhotoSizesBtn: UIButton!
    
    private let disposeBag = DisposeBag()
    var viewModel: PhotoDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
    }

}


extension PhotoDetailsViewController {

    private func setupUI(){
        setupPhotoTitleLabel()
    }
    
    private func setupPhotoTitleLabel(){
        guard let viewModel = self.viewModel else {return}
        self.photoTitleLabel.text = viewModel.photo.title
    }
    
}


extension PhotoDetailsViewController {
    
    private func setupBinding(){
        bindPhotoImageView()
        bindGetPhotoSizesBtnTap()
    }
    
   
    
    private func bindPhotoImageView(){
        guard let viewModel = self.viewModel else {return}
        viewModel.currentPhoto
            .bind { [weak self] image in
                guard let self = self else {return}
                guard let img = image else {return}
                self.photoImageView.image = img
            }.disposed(by: disposeBag)
    }

    
    private func bindGetPhotoSizesBtnTap(){
        getPhotoSizesBtn.rx.tap
            .bind(onNext: { [weak self] _ in
                guard let self = self else {return}
                guard let viewModel = self.viewModel  else {return}
                viewModel.fetchPhotoSizes.accept(())
            }).disposed(by: disposeBag)
    }
    
}
