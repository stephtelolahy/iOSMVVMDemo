//
//  AppModules.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

// Application dependencies

let sharedApiService: APIService = LocalAPIService() //AlamofireAPIService()

let sharedDataManager: IDataManager = DataManager(apiService: sharedApiService)
