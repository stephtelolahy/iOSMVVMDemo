//
//  PhotosPresenterTest.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 11/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import XCTest
import Cuckoo
import RxSwift
import RxTest

class PhotosPresenterTest: XCTestCase {

    private var presenter: PhotosPresenter!
    private var mockDataManager: MockIDataManager!
    private var mockView: MockPhotosView!
    
    override func setUp() {
        super.setUp()
        mockView = MockPhotosView()
        Cuckoo.stub(mockView) { mock in
            when(mock).setLoadingVisible(any()).thenDoNothing()
            when(mock).fill(photos: any()).thenDoNothing()
            when(mock).showError(any()).thenDoNothing()
        }
        mockDataManager = MockIDataManager()
        presenter = PhotosPresenter(view: mockView, dataManager: mockDataManager)
    }
    
    func testPhotoLoadedOnViewWillAppearIfDataManagerSucceed() {
        // Given
        let photos = [Photo(artist: "a", thumbUrl: "b")]
        Cuckoo.stub(mockDataManager) { mock in
            when(mock.fetchPhotos()).thenReturn(Observable.just(photos))
        }
        
        // When
        presenter.onViewWillAppear()
        
        // Assert
        verify(mockDataManager).fetchPhotos()
        
        let photosArgument = ArgumentCaptor<[Photo]>()
        verify(mockView).fill(photos: photosArgument.capture())
        XCTAssertEqual(photosArgument.value, photos)
        
        let boolArgument = ArgumentCaptor<Bool>()
        verify(mockView, times(2)).setLoadingVisible(boolArgument.capture())
        XCTAssertEqual(boolArgument.allValues, [true, false])
    }
    
    func testErrorOcurredOnViewWillAppearIfDataManagerFailed() {
        // Given
        let error = NSError(domain: "Got an error", code: 0)
        Cuckoo.stub(mockDataManager) { mock in
            when(mock.fetchPhotos()).thenReturn(Observable.error(error))
        }
        
        // When
        presenter.onViewWillAppear()
        
        // Assert
        let errorArgument = ArgumentCaptor<Error>()
        verify(mockView).showError(errorArgument.capture())
        XCTAssertErrorEqual(errorArgument.value!, error)
    }
}
