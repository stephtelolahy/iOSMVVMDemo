//
//  LocalAPIService.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

class LocalAPIService: APIService {
    
    func fetchPhotos() -> Observable<[Photo]> {
        return load([Photo].self, from: "photos")
    }
    
    func load<T: Codable>(_ class: T.Type, from file: String) -> Observable<T> {
        return Observable.create{ observer in
            do {
                let fileURL = Bundle(for: type(of: self)).url(forResource: file, withExtension:"json")!
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
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
