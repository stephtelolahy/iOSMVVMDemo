//
//  APIJsonDecoder.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import Foundation

class APIJsonDecoder: JSONDecoder {
    
    override init() {
        super.init()
        self.dateDecodingStrategy = .iso8601
    }
}
