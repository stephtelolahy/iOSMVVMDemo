//
//  PhotoExtensions.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

extension Photo: Equatable {
    static func ==(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Photo {
    static func sample() -> Photo {
        return Photo(id: 1,
                     format: "jpeg",
                     width: 4912,
                     height: 2760,
                     filename: "0144_TuOiIpkIea8.jpeg",
                     author: "Mouly Kumar",
                     author_url: "https://unsplash.com/@moulykumar",
                     post_url: "https://unsplash.com/photos/TuOiIpkIea8")
    }
    
}
