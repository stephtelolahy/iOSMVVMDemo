//
//  AppModules.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/2/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.
//

// Application dependencies

private let useLocalDataSource: Bool = Bundle.main.infoDictionary?["USE_LOCAL_DATASOURCE"] as? String == "YES"

private let serverUrl: String = Bundle.main.infoDictionary?["SERVER_URL"] as! String

private func createRemoteAPIService() -> APIService {
    return AlamofireAPIService(serverUrl: serverUrl, decoder: APIJsonDecoder())
}

private func createLocalAPIService() -> APIService {
    return LocalAPIService(decoder: APIJsonDecoder())
}

private let sharedApiService: APIService = useLocalDataSource ? createLocalAPIService() : createRemoteAPIService()

let sharedDataManager: IDataManager = DataManager(apiService: sharedApiService)
