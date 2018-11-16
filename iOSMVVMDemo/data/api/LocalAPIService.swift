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
    
    private let mapper: Mapper
    private let jsonReader = Bundle.main
    
    init(mapper: Mapper) {
        self.mapper = mapper
    }
    
    // MARK: - APIService
    
    func search(text: String) -> Observable<[Photo]> {
        return jsonReader.load(PhotoListDto.self, file: "photos").map { dto -> [Photo] in
            self.mapper.map(dto: dto)
        }
    }
}

private extension Bundle {
    func load<T: Codable>(_ class: T.Type, file: String) -> Observable<T> {
        return Observable.create{ observer in
            do {
                let decoder = JSONDecoder()
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
