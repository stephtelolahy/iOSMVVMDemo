//
//  AppModule.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

class AppModule {

    static let sharedApiService = AlamofireAPIService()
    static let sharedDataManager = DataManager(apiService: sharedApiService)
}
