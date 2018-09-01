//
//  PhotoListViewModelTest.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 8/19/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import XCTest
import RxSwift
import Cuckoo
import RxTest

class PhotoListViewModelTest: XCTestCase {
    
    private var mockDataManager: MockIDataManager!
    private var viewModel: PhotoListViewModel!
    private let disposeBag = DisposeBag()
    private var photosObserver: TestableObserver<[Photo]>!
    private var errorObserver: TestableObserver<Error>!
    private var loadingObserver: TestableObserver<Bool>!
    
    override func setUp() {
        super.setUp()
        mockDataManager = MockIDataManager()
        viewModel = PhotoListViewModel(dataManager: mockDataManager)
        let scheduler = TestScheduler(initialClock: 0)
        photosObserver = scheduler.createObserver([Photo].self)
        viewModel.photosSubject.subscribe(photosObserver).disposed(by: disposeBag)
        errorObserver = scheduler.createObserver(Error.self)
        viewModel.errorSubject.subscribe(errorObserver).disposed(by: disposeBag)
        loadingObserver = scheduler.createObserver(Bool.self)
        viewModel.loadingSubject.subscribe(loadingObserver).disposed(by: disposeBag)
    }
    
    func testFetchPhotoSucceedOnViewWillAppear() {
        // Given
        let photos = [Photo.sample()]
        stub(mockDataManager) { mock in
            when(mock.fetchPhotos()).thenReturn(Observable.just(photos))
        }
        
        // When
        viewModel.onViewWillAppear()
        
        // Assert
        verify(mockDataManager, times(1)).fetchPhotos()
        verifyNoMoreInteractions(mockDataManager)
        XCTAssertEqual([next(0, photos)], photosObserver.events)
        XCTAssertEqual([next(0, true), next(0, false)], loadingObserver.events)
    }
    
    func testFetchPhotoFailedOnViewWillAppear() {
        // Given
        let error: Error = NSError(domain: "Got an error", code: 0)
        stub(mockDataManager) { mock in
            when(mock.fetchPhotos()).thenReturn(Observable.error(error))
        }
        
        // When
        viewModel.onViewWillAppear()
        
        // Assert
        verify(mockDataManager, times(1)).fetchPhotos()
        XCTAssertEqual(1, errorObserver.events.count)
        XCTAssertEqual(error.localizedDescription, errorObserver.events[0].value.element!.localizedDescription)
        XCTAssertEqual([next(0, true), next(0, false)], loadingObserver.events)
    }
}

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Photo {
    static func sample() -> Photo {
        return Photo(id: Int(arc4random_uniform(UInt32(100))) ,
                     format: "jpeg",
                     width: 4912,
                     height: 2760,
                     filename: "0144_TuOiIpkIea8.jpeg",
                     author: "Mouly Kumar",
                     author_url: "https://unsplash.com/@moulykumar",
                     post_url: "https://unsplash.com/photos/TuOiIpkIea8")
    }
}
