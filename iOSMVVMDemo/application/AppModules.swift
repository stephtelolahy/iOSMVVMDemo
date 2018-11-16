//
//  AppModules.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

// Application dependencies

import Foundation

private let useLocalDataSource: Bool = Bundle.main.infoDictionary?["USE_LOCAL_DATASOURCE"] as? String == "YES"

private func createLocalAPIService() -> APIService {
    return LocalAPIService(mapper: Mapper())
}

private func createRemoteAPIService() -> APIService {
    let serverUrl: String = Bundle.main.infoDictionary?["SERVER_URL"] as! String
    return NetworkAPIService(baseUrl: serverUrl, mapper: Mapper())
}

private let sharedApiService: APIService = useLocalDataSource ? createLocalAPIService() : createRemoteAPIService()

let sharedDataManager: IDataManager = DataManager(apiService: sharedApiService)
