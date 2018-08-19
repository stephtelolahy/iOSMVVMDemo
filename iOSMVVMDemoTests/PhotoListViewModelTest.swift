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

class PhotoListViewModelTest: XCTestCase {
    
    private var mockDataManager: MockIDataManager!
    private var photoListViewModel: PhotoListViewModel!
    private let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        mockDataManager = MockIDataManager()
        photoListViewModel = PhotoListViewModel(dataManager: mockDataManager)
    }
    
    override func tearDown() {
        photoListViewModel = nil
        mockDataManager = nil
        super.tearDown()
    }
    
    func testFetchPhotoWhenViewWillAppear() {
        // Given
        let photos = [Photo.sample()]
        stub(mockDataManager) { mock in
            mock.fetchPhotos().thenReturn(Observable.just(photos))
        }
        
        let expect = XCTestExpectation(description: "photos triggered")
        photoListViewModel.photosSubject.subscribe(onNext: { result in
            XCTAssertEqual(photos, result)
            expect.fulfill()
        }).disposed(by: disposeBag)
        
        // When
        photoListViewModel.onViewWillAppear()
        
        // Assert
        verify(mockDataManager, times(1)).fetchPhotos()
        wait(for: [expect], timeout: 1.0)
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
