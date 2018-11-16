//
//  PhotosViewModelTest.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 8/19/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import XCTest
import RxSwift
import Cuckoo
import RxTest

class PhotosViewModelTest: XCTestCase {
    
    private var viewModel: PhotosViewModel!
    
    private var mockDataManager: MockIDataManager!
    private var photosObserver: TestableObserver<[Photo]>!
    private var errorObserver: TestableObserver<Error>!
    private var loadingObserver: TestableObserver<Bool>!
    private let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        mockDataManager = MockIDataManager()
        viewModel = PhotosViewModel(dataManager: mockDataManager)
        
        let scheduler = TestScheduler(initialClock: 0)
        photosObserver = scheduler.createObserver([Photo].self)
        viewModel.photosSubject.subscribe(photosObserver).disposed(by: disposeBag)
        errorObserver = scheduler.createObserver(Error.self)
        viewModel.errorSubject.subscribe(errorObserver).disposed(by: disposeBag)
        loadingObserver = scheduler.createObserver(Bool.self)
        viewModel.loadingSubject.subscribe(loadingObserver).disposed(by: disposeBag)
    }
    
    func testSearchSucceed() {
        // Given
        let photos = [Photo(artist: "aa", thumbUrl: "ab")]
        Cuckoo.stub(mockDataManager) { mock in
            when(mock.search(text: "a")).thenReturn(Observable.just(photos))
        }
        
        // When
        viewModel.onSearch(text: "a")
        
        // Assert
        verify(mockDataManager, times(1)).search(text: "a")
        XCTAssertEqual([next(0, photos)], photosObserver.events)
        XCTAssertEqual([next(0, true), next(0, false)], loadingObserver.events)
    }
    
    func testSearchFailed() {
        // Given
        let error = NSError(domain: "Got an error", code: 0)
        Cuckoo.stub(mockDataManager) { mock in
            when(mock.search(text: anyString())).thenReturn(Observable.error(error))
        }
        
        // When
        viewModel.onSearch(text: "c")
        
        // Assert
        XCTAssertErrorEqual(error, errorObserver.events[0].value.element!)
        XCTAssertEqual([], photosObserver.events)
        XCTAssertEqual([next(0, true), next(0, false)], loadingObserver.events)
    }
}
