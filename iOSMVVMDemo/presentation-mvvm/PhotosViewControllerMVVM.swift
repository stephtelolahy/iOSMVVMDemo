//
//  PhotoListViewController.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import RxSwift

class PhotosViewControllerMVVM: UITableViewController {
    
    // MARK: - Fields
    
    private lazy var viewModel: PhotosViewModel = {
        return PhotosViewModel(dataManager: sharedDataManager)
    }()
    
    private var photos: [Photo] = []
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.photosSubject.subscribe(onNext: { photos in
            self.photos = photos
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.loadingSubject.subscribe(onNext: { loading in
            print("Toggle loading \(loading)")
        }).disposed(by: disposeBag)
        
        viewModel.errorSubject.subscribe(onNext: { error in
            print("An error occurred: \(error.localizedDescription)")
        }).disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.onViewWillAppear()
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
