//
//  PhotosViewControllerMVP.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 11/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class PhotosViewControllerMVP: UIViewController {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    
    private var photos: [Photo] = []
    private lazy var presenter: PhotosPresenter = { PhotosPresenter(view: self, dataManager: sharedDataManager) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
    }
}

extension PhotosViewControllerMVP: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.confgure(with: photos[indexPath.row])
        return cell
    }
}

extension PhotosViewControllerMVP: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.onSearch(text: searchText)
    }
}

extension PhotosViewControllerMVP: PhotosView {
    
    func fill(photos: [Photo]) {
        self.photos = photos
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "An error occurred", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func setLoadingVisible(_ visible: Bool) {
        if visible {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
    }
    
}
