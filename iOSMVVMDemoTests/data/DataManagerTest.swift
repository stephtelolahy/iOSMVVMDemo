//
//  DataManagerTest.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import XCTest
import RxSwift
import Cuckoo
import RxBlocking
import RxTest

class DataManagerTest: XCTestCase {
    
    private var dataManager: DataManager!
    
    private var mockAPIService: MockAPIService!
    
    override func setUp() {
        mockAPIService = MockAPIService()
        dataManager = DataManager(apiService: mockAPIService)
    }
    
    func testFetchPhotosSucceedIfApiServiceSucceed() {
        // Given
        let expectedPhotos = [Photo.sample()]
        Cuckoo.stub(mockAPIService) { mock in
            when(mock.fetchPhotos()).thenReturn(Observable.just(expectedPhotos))
        }
        
        // When
        // Assert
        XCTAssertEqual(try dataManager.fetchPhotos().toBlocking(timeout: 0.1).first(), expectedPhotos)
    }
    
    func testFetchPhotosFailIfApiServiceFails() {
        // Given
        let expectedError = NSError(domain: "Got an error", code: 0)
        Cuckoo.stub(mockAPIService) { mock in
            when(mock.fetchPhotos()).thenReturn(Observable.error(expectedError))
        }
        
        // When
        // Assert
        XCTAssertThrowsErrorEqual(try dataManager.fetchPhotos().toBlocking().first(), expectedError)
    }
    
}
