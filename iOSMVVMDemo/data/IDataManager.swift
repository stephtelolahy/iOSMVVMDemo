//
//  IDataManager.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/1/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

import RxSwift

protocol IDataManager {
    func search(text: String) -> Observable<[Photo]>
}
