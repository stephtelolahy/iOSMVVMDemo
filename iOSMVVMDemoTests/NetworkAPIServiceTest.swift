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
    
    func testFetchPhotosSucceed() {
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
            XCTAssertEqual(request.url?.queryParameters, ["term": "avengers", "entity" : "movie"])
            return true
        }
        stub(matcher, jsonData(response.data(using: .utf8)!))
        
        let expectedPhotos = [Photo(artist: "Beyoncé",
                                    thumbUrl: "https://is1-ssl.mzstatic.com/image/thumb/100x100bb.jpg")]
        
        XCTAssertEqual(try apiService.fetchPhotos().toBlocking().first(), expectedPhotos)
    }
    
    func testFetchPhotosFailedUnauthorized() {
        stub(everything, http(403))
        XCTAssertThrowsError(try apiService.fetchPhotos().toBlocking().first()) { actualError in
            XCTAssertEqual(actualError as? ApiError, ApiError.unauthorized)
        }
    }
    
}
