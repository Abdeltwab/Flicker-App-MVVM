//
//  PhotoGalleryContainerViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import UIKit
import RxCocoa
import RxSwift


class PhotoGalleryContainerViewController: UIViewController, UISearchBarDelegate ,PhotoGalleryContainerViewControllerProtocol {
    
    private let disposeBag = DisposeBag()
    var viewModel: PhotoGalleryContainerViewModel?
    
    
    @IBOutlet weak var searchResultsContianerView: UIView!
    var searchController: UISearchController!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else {return}
        viewModel.route(to: .photoGallery(view: searchResultsContianerView), from: self)
        setupUI()
        setupUIBinding()
    }
}

//MARK: - UI
extension PhotoGalleryContainerViewController{
    
    private func setupUI(){
        
        setupNavigationBarTitle()
        setupSearchController()
    }

    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.view.backgroundColor = .white
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search PlacHolder"
        searchController.hidesNavigationBarDuringPresentation = true
        navigationItem.searchController = searchController
    }

    private func setupNavigationBarTitle(){
        self.title = "Image Search"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}


//MARK: Binding
extension PhotoGalleryContainerViewController {
    
    private func setupUIBinding(){
        bindSearhTextField()
    }
    
    
    private func bindSearhTextField() {
        searchController.searchBar.rx.text
            .do { [weak self](searchText) in
                guard let self = self else {return}
                guard let viewModel = self.viewModel else {return}
                if viewModel.searchText.value == searchText {
                    return
                }else{
                    viewModel.searchText.accept(searchText ?? "")
                }
            }
            .subscribe()
            .disposed(by: disposeBag)
    }

}
