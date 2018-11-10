//
//  PhotosPresenter.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 11/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

protocol PhotosView {
    func fill(photos: [Photo])
    func showError(_ error: Error)
    func setLoadingVisible(_ visible: Bool)
}

class PhotosPresenter {
    
    private unowned var view: AnyObject & PhotosView
    private let dataManager: IDataManager
    private let disposeBag = DisposeBag()
    
    init(view: AnyObject & PhotosView, dataManager: IDataManager) {
        self.view = view
        self.dataManager = dataManager
    }
    
    func onViewWillAppear() {
        view.setLoadingVisible(true)
        dataManager.fetchPhotos().subscribe(
            onNext: { photos in
                self.view.setLoadingVisible(false)
                self.view.fill(photos: photos)
        }, onError: { error in
            self.view.setLoadingVisible(false)
            self.view.showError(error)
        }).disposed(by: disposeBag)
    }
    
}
