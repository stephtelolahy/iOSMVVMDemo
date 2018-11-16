//
//  PhotoListViewController.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import RxSwift

class PhotosViewControllerMVVM: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    private var photos: [Photo] = []
    private lazy var viewModel: PhotosViewModel = { PhotosViewModel(dataManager: sharedDataManager) }()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        observeViewData()
    }
}

extension PhotosViewControllerMVVM: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.confgure(with: photos[indexPath.row])
        return cell
    }
}

extension PhotosViewControllerMVVM: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.onSearch(text: searchText)
    }
}

extension PhotosViewControllerMVVM {
    func observeViewData() {
        viewModel.photosSubject.subscribe(onNext: { photos in
            self.photos = photos
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.loadingSubject.subscribe(onNext: { loading in
            if loading {
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
        }).disposed(by: disposeBag)
        
        viewModel.errorSubject.subscribe(onNext: { error in
            let alert = UIAlertController(title: "An error occurred", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }).disposed(by: disposeBag)
    }
}
