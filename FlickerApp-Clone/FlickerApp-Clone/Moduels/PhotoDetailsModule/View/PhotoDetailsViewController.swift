//
//  PhotoDetailsViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 06/10/2021.
//

import UIKit

class PhotoDetailsViewController: UIViewController ,PhotoDetailsViewControllerProtocol {
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var getPhotoSizesBtn: UIButton!
    
    var viewModel: PhotoDetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension PhotoDetailsViewController {
    
}
