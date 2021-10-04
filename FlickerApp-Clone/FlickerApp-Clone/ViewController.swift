//
//  ViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 03/10/2021.
//

import UIKit

class ViewController: UIViewController ,PhotoSearchProtocl{
    
    var service = PhotoSearchService()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.searchPhotos(text: "Car") { resuls in
            switch resuls{
            case let .success(res):
                print(res)
            case let .failure(err):
                print(err)
            }
        }
    }


}

