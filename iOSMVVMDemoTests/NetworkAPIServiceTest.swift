//
//  NetworkAPIServiceTest.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import XCTest
import RxTest
import RxBlocking
import Mockingjay

class NetworkAPIServiceTest: XCTestCase {
    
    private var apiService: NetworkAPIService!
    
    override func setUp() {
        apiService = NetworkAPIService(baseUrl: "https://my.server.com", mapper: Mapper())
    }
    
    func testSearchSucceed() {
        // Given
        let response = """
                        {
                        "resultCount": 1,
                        "results": [
                            {
                                "artistName": "Beyoncé",
                                "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/100x100bb.jpg"
                            }
                        ]
                        }
                        """
        func matcher(request: URLRequest) -> Bool {
            XCTAssertEqual(request.url?.urlWithoutParameters, "https://my.server.com/search")
            XCTAssertEqual(request.httpMethod, HTTPMethod.get.description)
            XCTAssertEqual(request.url?.queryParameters, ["term": "beyonce"])
            return true
        }
        stub(matcher, jsonData(response.data(using: .utf8)!))
        
        // When Assert
        let expectedPhotos = [Photo(artist: "Beyoncé",
                                    thumbUrl: "https://is1-ssl.mzstatic.com/image/thumb/100x100bb.jpg")]
        XCTAssertEqual(try apiService.search(text: "beyonce").toBlocking().first(), expectedPhotos)
    }
    
    func testSearchFailedUnauthorized() {
        // Given
        stub(everything, http(403))
        
        // When Assert
        XCTAssertThrowsError(try apiService.search(text: "bob").toBlocking().first()) { actualError in
            XCTAssertEqual(actualError as? ApiError, ApiError.unauthorized)
        }
    }
    
}
