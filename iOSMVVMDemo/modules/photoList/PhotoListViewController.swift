//
//  PhotoListViewController.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import UIKit
import RxSwift
import MBProgressHUD

class PhotoListViewController: UITableViewController {
    
    // MARK: - Fields
    
    private var photos: [Photo] = []
    private var viewModel: PhotoListViewModel?
    private let disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PhotoListViewModel(dataManager: AppModule.sharedDataManager)
        observeViewData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.onViewWillAppear()
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
    
    // MARK: - TableView delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.onPhotoSelected(photos[indexPath.row])
    }
    
    // MARK: - Binding
    
    private func observeViewData() {
        viewModel?.photosSubject.subscribe(onNext: { photos in
            self.photos = photos
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel?.loadingSubject.subscribe(onNext: { loading in
            if (loading) {
                MBProgressHUD.showAdded(to: self.view, animated: true)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }).disposed(by: disposeBag)
        
        viewModel?.errorSubject.subscribe(onNext: { error in
            self.showAlert(withMessage: error.localizedDescription)
        }).disposed(by: disposeBag)
        
        viewModel?.toDetailSubject.subscribe(onNext: { photo in
            self.performSegue(withIdentifier: "toDetail", sender: photo)
        }).disposed(by: disposeBag)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let detailsViewController = segue.destination as? PhotoDetailViewController,
            let photo = sender as? Photo {
            detailsViewController.photo = photo
        }
    }
}

extension UIViewController {
    
    func showAlert(withMessage message: String ) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
