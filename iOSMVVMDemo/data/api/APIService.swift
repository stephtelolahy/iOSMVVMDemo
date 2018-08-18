//
//  APIService.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift
import Alamofire

protocol APIService {
    func fetchPhotos() -> Observable<[Photo]>
}

class AlamofireAPIService: APIService {
    
    private let alamoFireManager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
    
    func fetchPhotos() -> Observable<[Photo]> {
        return alamoFireManager.get([Photo].self, from: "https://picsum.photos/list")
    }
}

private extension Alamofire.SessionManager {
    
    func get<T: Codable>(_ class: T.Type, from url: String) -> Observable<T> {
        let headers = ["Content-Type": "application/json"]
        return Observable.create{ observer in
            self.request(url, method: .get, headers: headers)
                .validate()
                .responseData(completionHandler: { (dataResponse) in
                    do {
                        let model = try JSONDecoder().decode(T.self, from: dataResponse.data!)
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
