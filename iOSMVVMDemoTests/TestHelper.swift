//
//  TestHelper.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import Foundation

func sampleError() -> Error {
    return NSError(domain: "Got an error", code: 0)
}

func samplePhoto() -> Photo {
    return Photo(id: Int(arc4random_uniform(UInt32(100))) ,
                 format: "jpeg",
                 width: 4912,
                 height: 2760,
                 filename: "0144_TuOiIpkIea8.jpeg",
                 author: "Mouly Kumar",
                 author_url: "https://unsplash.com/@moulykumar",
                 post_url: "https://unsplash.com/photos/TuOiIpkIea8")
}
