//
//  PhotoGalleryContainerViewController.swift
//  FlickerApp-Clone
//
//  Created by Abdeltawab Mohamed on 04/10/2021.
//

import UIKit

class PhotoGalleryContainerViewController: UIViewController, UISearchBarDelegate {
    

    
    var searchController: UISearchController!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
