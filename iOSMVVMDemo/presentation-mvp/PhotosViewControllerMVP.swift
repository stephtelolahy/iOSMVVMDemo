//
//  PhotosViewControllerMVP.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 11/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit

class PhotosViewControllerMVP: UITableViewController {
    
    // MARK: - Fields
    
    private lazy var presenter: PhotosPresenter = {
        return PhotosPresenter(view: self, dataManager: sharedDataManager)
    }()
    
    private var photos: [Photo] = []
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.onViewWillAppear()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.confgure(withPhoto: photos[indexPath.row])
        return cell
    }
}

extension PhotosViewControllerMVP: PhotosView {
    
    func fill(photos: [Photo]) {
        self.photos = photos
        tableView.reloadData()
    }
    
    func showError(_ error: Error) {
        self.showAlert(withMessage: error.localizedDescription)
    }
    
    func setLoadingVisible(_ visible: Bool) {
        print("Toggle loading \(visible)")
    }
    
}
