//
//  AlamofireAPIServiceTest.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import XCTest
import Mockingjay

class AlamofireAPIServiceTest: XCTestCase {
    
    private var apiService: AlamofireAPIService!
    
    override func setUp() {
        apiService = AlamofireAPIService(serverUrl: "https://my.server.com", decoder: APIJsonDecoder())
    }
    
    func testFetchPhotosParseJsonResponseSuccessfully() {
        // Given
        let response = """
                        [
                            {
                                "format": "jpeg",
                                "width": 5616,
                                "height": 3744,
                                "filename": "0000_yC-Yzbqy7PY.jpeg",
                                "id": 1,
                                "author": "Alejandro Escamilla",
                                "author_url": "https://unsplash.com/@alejandroescamilla",
                                "post_url": "https://unsplash.com/photos/yC-Yzbqy7PY"
                            }
                        ]
                        """
        stub(http(.get, uri: "https://my.server.com/list"), jsonData(response.data(using: .utf8)!))
        let expectedPhotos = [Photo(id: 1 ,
                                    format: "jpeg",
                                    width: 5616,
                                    height: 3744,
                                    filename: "0000_yC-Yzbqy7PY.jpeg",
                                    author: "Alejandro Escamilla",
                                    author_url: "https://unsplash.com/@alejandroescamilla",
                                    post_url: "https://unsplash.com/photos/yC-Yzbqy7PY")]
        
        // When
        // Assert
        XCTAssertEqual(try apiService.fetchPhotos().toBlocking().first(), expectedPhotos)
    }
    
    func testFetchPhotosReturnEmptyArrayIfJsonResponseIsEmpty() {
        // Given
        stub(http(.get, uri: "https://my.server.com/list"), json([]))
        
        // When
        // Assert
        XCTAssertEqual(try apiService.fetchPhotos().toBlocking().first(), [])
    }
    
    func testFetchPhotosFailedIfUnauthorized() {
        // Given
        stub(http(.get, uri: "https://my.server.com/list"), http(403))
        
        // When
        // Assert
        XCTAssertThrowsError(try apiService.fetchPhotos().toBlocking().first()) { actualError in
        }
    }
    
}
