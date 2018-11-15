//
//  Mapper.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 11/15/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

class Mapper {

    func map(dto: PhotoListDto) -> [Photo] {
        return dto.results?.map { item -> Photo in
            Photo(artist: item.artistName ?? "",
                  thumbUrl: item.artworkUrl100 ?? "")
        } ?? []
    }
}
