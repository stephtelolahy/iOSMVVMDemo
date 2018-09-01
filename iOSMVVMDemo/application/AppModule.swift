//
//  AppModule.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

// Application dependencies
class AppModule {

    static let sharedApiService: APIService = AlamofireAPIService()
    static let sharedDataManager: IDataManager = DataManager(apiService: sharedApiService)
}
