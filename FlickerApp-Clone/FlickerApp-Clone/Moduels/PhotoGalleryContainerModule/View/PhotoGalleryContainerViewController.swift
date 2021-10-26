//
//  PhotoGalleryContainerViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import RxCocoa
import RxSwift
import UIKit

class PhotoGalleryContainerViewController: UIViewController, UISearchBarDelegate, PhotoGalleryContainerViewControllerProtocol {
    private let disposeBag = DisposeBag()
    var viewModel: PhotoGalleryContainerViewModel?

    @IBOutlet var searchResultsContianerView: UIView!
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupUIBinding()
    }
}

// MARK: - UI

extension PhotoGalleryContainerViewController {
    private func setupUI() {
        addSubViews()
        setupNavigationBarTitle()
        setupSearchController()
    }

    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.view.backgroundColor = .white
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search PlacHolder"
        //TODO: -  Check why this dismss the Viewcontoller
       searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.becomeFirstResponder()

    }

    private func setupNavigationBarTitle() {
        title = "Image Search"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func addSubViews() {
        guard let viewModel = self.viewModel else { return }
        viewModel.showPhotosGallery(context: self, photosContainerView: searchResultsContianerView)
    }
}

// MARK: Binding

extension PhotoGalleryContainerViewController {
    private func setupUIBinding() {
        bindSearhTextField()
    }

    private func bindSearhTextField() {
        let searchTextField = searchController.searchBar.searchTextField
        searchTextField.rx
            .controlEvent([.editingDidEndOnExit])
            .observe(on: MainScheduler.instance)
            .do { [weak self] _ in
                guard let self = self else { return }
                guard let viewModel = self.viewModel else { return }
                viewModel.fetchSearchResults.accept(searchTextField.text)
            }
            .subscribe()
            .disposed(by: disposeBag)
    }
}
