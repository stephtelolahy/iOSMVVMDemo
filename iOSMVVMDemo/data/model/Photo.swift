//
//  Photo.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

struct Photo: Codable {
    let id: Int
    let format: String
    let width: Int
    let height: Int
    let filename: String
    let author: String
    let author_url: String
    let post_url: String
}