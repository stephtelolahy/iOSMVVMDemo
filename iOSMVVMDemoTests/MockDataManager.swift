//
//  MockDataManager.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 8/19/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class MockDataManager: IDataManager {
    
    var isFetchPhotosCalled = false
    var fetchPhotoResponse: Observable<[Photo]>!
    
    func fetchPhotos() -> Observable<[Photo]> {
        isFetchPhotosCalled = true
        return fetchPhotoResponse
    }
}
