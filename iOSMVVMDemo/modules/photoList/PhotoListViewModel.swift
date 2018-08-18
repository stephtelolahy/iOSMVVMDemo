//
//  PhotoListViewModel.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class PhotoListViewModel {
    
    private unowned let dataManager: IDataManager
    private let disposeBag = DisposeBag()
    
    let photosSubject = PublishSubject<[Photo]>()
    let loadingSubject = PublishSubject<Bool>()
    let toDetailSubject = PublishSubject<Photo>()
    
    init(dataManager: IDataManager) {
        self.dataManager = dataManager
    }
    
    func onViewWillAppear() {
        loadingSubject.onNext(true)
        dataManager.fetchPhotos().subscribe(
            onNext: { photos in
                self.loadingSubject.onNext(false)
                self.photosSubject.onNext(photos)
        }, onError: { error in
            self.loadingSubject.onNext(false)
            print("onError \(error)")
        }).disposed(by: disposeBag)
    }
    
    func onPhotoSelected(_ photo: Photo) {
        toDetailSubject.onNext(photo)
    }
    
}
