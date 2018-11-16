//
//  PhotoDto.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 11/15/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

struct PhotoDto: Codable {
    var artistName: String?
    var collectionName: String?
    var previewUrl: String?
    var artworkUrl100: String?
}

struct PhotoListDto: Codable {
    var resultCount: Int?
    var results: [PhotoDto]?
}
