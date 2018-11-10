//
//  AlamofireAPIService.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/1/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift
import Alamofire

class AlamofireAPIService: APIService {
    
    // MARK: - Dependencies
    
    private let serverUrl: String
    private let jsonDecoder: JSONDecoder
    private let alamoFireManager = Alamofire.SessionManager(configuration: .default)
    
    init(serverUrl: String, decoder: JSONDecoder) {
        self.serverUrl = serverUrl
        self.jsonDecoder = decoder
    }
    
    // MARK: - APIService
    
    func fetchPhotos() -> Observable<[Photo]> {
        return alamoFireManager.get([Photo].self, decoder: jsonDecoder, from: "\(serverUrl)/list")
    }
}

private extension Alamofire.SessionManager {
    
    func get<T: Codable>(_ class: T.Type,
                         decoder: JSONDecoder,
                         from url: String,
                         headers: [String: String] = ["Content-Type": "application/json"]) -> Observable<T> {
        return Observable.create{ observer in
            self.request(url, method: .get, headers: headers)
                .validate()
                .responseData(completionHandler: { (dataResponse) in
                    do {
                        let model = try decoder.decode(T.self, from: dataResponse.data!)
                        observer.onNext(model)
                        observer.onCompleted()
                    } catch let error {
                        observer.onError(error)
                    }
                })
            return Disposables.create()
        }
    }
}
