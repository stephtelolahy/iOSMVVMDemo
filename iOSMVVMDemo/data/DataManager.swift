//
//  DataManager.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

protocol IDataManager: class {
    func fetchPhotos() -> Observable<[Photo]>
}

class DataManager: IDataManager {
    
    // MARK: - Dependencies
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    // MARK: - IDataManager
    
    func fetchPhotos() -> Observable<[Photo]> {
        return apiService.fetchPhotos()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
    }
    
}
