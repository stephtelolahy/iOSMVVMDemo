//
//  DataManager.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class DataManager: IDataManager {
    
    // MARK: - Dependencies
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    // MARK: - IDataManager
    
    func search(text: String) -> Observable<[Photo]> {
        return apiService.search(text: text)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
    }
    
}
