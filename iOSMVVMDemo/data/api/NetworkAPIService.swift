//
//  NetworkAPIService.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/1/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift
import Alamofire

class NetworkAPIService: APIService {
    
    // MARK: - Dependencies
    
    private let baseUrl: String
    private let mapper: Mapper
    private let networkClient = SessionManager(configuration: .default)
    
    init(baseUrl: String, mapper: Mapper) {
        self.baseUrl = baseUrl
        self.mapper = mapper
    }
    
    // MARK: - APIService
    
    func search(text: String) -> Observable<[Photo]> {
        return networkClient.get(PhotoListDto.self, url: "\(baseUrl)/search?term=\(text)&entity=movie")
            .map { dto -> [Photo] in
                self.mapper.map(dto: dto)
        }
    }
}

private extension Alamofire.SessionManager {
    func get<T: Codable>(_ class: T.Type, url: String) -> Observable<T> {
        return Observable.create{ observer in
            self.request(url, method: .get)
                .validate()
                .responseData(completionHandler: { dataResponse in
                    do {
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(T.self, from: dataResponse.data!)
                        observer.onNext(model)
                        observer.onCompleted()
                    } catch let error {
                        if dataResponse.response?.statusCode == 403 {
                            observer.onError(ApiError.unauthorized)
                        } else {
                            observer.onError(error)
                        }
                    }
                })
            return Disposables.create()
        }
    }
}
