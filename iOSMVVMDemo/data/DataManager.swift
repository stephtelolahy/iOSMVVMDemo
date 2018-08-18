//
//  DataManager.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

protocol IDataManager: class {
    func fetchPhotos() -> Observable<[Photo]>
}

class DataManager: IDataManager {
    
    static let shared = DataManager()
    
    func fetchPhotos() -> Observable<[Photo]> {
        return Observable.just([Photo.sample(), Photo.sample()])
            .delay(2, scheduler: MainScheduler.instance)
    }
}

private extension Photo {
    
    static func sample() -> Photo {
        return Photo(id: 144,
                     format: "jpeg",
                     width: 4912,
                     height: 2760,
                     filename: "0144_TuOiIpkIea8.jpeg",
                     author: "Mouly Kumar",
                     author_url: "https://unsplash.com/@moulykumar",
                     post_url: "https://unsplash.com/photos/TuOiIpkIea8")
    }
}
