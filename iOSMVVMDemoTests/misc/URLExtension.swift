//
//  URLExtension.swift
//  iOSMVVMDemoTests
//
//  Created by Hugues Stéphano TELOLAHY on 11/15/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import Foundation

extension URL {
    var queryParameters: [String: String] {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else {
                return [:]
        }
        var parameters: [String: String] = [:]
        for item in queryItems {
            parameters[item.name] = item.value
        }
        return parameters
    }
    
    var urlWithoutParameters: String? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.query = nil
        return components.string
    }
}
