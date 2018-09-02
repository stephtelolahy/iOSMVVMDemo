//
//  LocalAPIService.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class LocalAPIService: APIService {
    
    // MARK: - Dependencies
    
    private let jsonDecoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        jsonDecoder = decoder
    }
    
    // MARK: - APIService
    
    func fetchPhotos() -> Observable<[Photo]> {
        return Bundle.main.load([Photo].self, decoder: jsonDecoder, from: "photos")
    }
}

private extension Bundle {
    
    func load<T: Codable>(_ class: T.Type,
                          decoder: JSONDecoder,
                          from file: String) -> Observable<T> {
        return Observable.create{ observer in
            do {
                let fileURL = self.url(forResource: file, withExtension:"json")!
                let data = try Data(contentsOf: fileURL)
                let model = try decoder.decode(T.self, from: data)
                observer.onNext(model)
                observer.onCompleted()
            }
            catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}
