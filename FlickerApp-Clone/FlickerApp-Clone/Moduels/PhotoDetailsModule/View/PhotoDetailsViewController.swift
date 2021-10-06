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
    var picker  = UIPickerView()

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
        //setupPickerView()
        setupPhotoTitleLabel()
    }
    
    private func setupPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
    }
    
    private func setupPhotoTitleLabel(){
        guard let viewModel = self.viewModel else {return}
        self.photoTitleLabel.text = viewModel.photo.title
    }
    
}


//MARK: - Picker View

extension PhotoDetailsViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "test"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       print(row)

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
//                guard let viewModel = self.viewModel  else {return}
                self.showAlertView(msg: "Hi , This feature stil under Development , please return back soon")
                //viewModel.fetchPhotoSizes.accept(())
            }).disposed(by: disposeBag)
    }
    
    
    //Temp
    private func showAlertView(msg:String){
        let alert = UIAlertController(title: "😇", message: msg, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
