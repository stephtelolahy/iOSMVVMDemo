// MARK: - Mocks generated from file: iOSMVVMDemo/data/IDataManager.swift at 2018-09-02 19:15:29 +0000

//
//  IDataManager.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 9/1/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.

import Cuckoo
@testable import iOSMVVMDemo

import RxSwift

class MockIDataManager: IDataManager, Cuckoo.ProtocolMock {
    typealias MocksType = IDataManager
    typealias Stubbing = __StubbingProxy_IDataManager
    typealias Verification = __VerificationProxy_IDataManager
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "fetchPhotos", "returnSignature": " -> Observable<[Photo]>", "fullyQualifiedName": "fetchPhotos() -> Observable<[Photo]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Photo]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func fetchPhotos()  -> Observable<[Photo]> {
        
            return cuckoo_manager.call("fetchPhotos() -> Observable<[Photo]>",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_IDataManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchPhotos() -> Cuckoo.ProtocolStubFunction<(), Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockIDataManager.self, method: "fetchPhotos() -> Observable<[Photo]>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_IDataManager: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchPhotos() -> Cuckoo.__DoNotUse<Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPhotos() -> Observable<[Photo]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class IDataManagerStub: IDataManager {
    

    

    
     func fetchPhotos()  -> Observable<[Photo]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Photo]>.self)
    }
    
}


// MARK: - Mocks generated from file: iOSMVVMDemo/data/api/APIService.swift at 2018-09-02 19:15:29 +0000

//
//  APIService.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 8/18/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.

import Cuckoo
@testable import iOSMVVMDemo

import RxSwift

class MockAPIService: APIService, Cuckoo.ProtocolMock {
    typealias MocksType = APIService
    typealias Stubbing = __StubbingProxy_APIService
    typealias Verification = __VerificationProxy_APIService
    let cuckoo_manager = Cuckoo.MockManager(hasParent: false)

    

    

    
    // ["name": "fetchPhotos", "returnSignature": " -> Observable<[Photo]>", "fullyQualifiedName": "fetchPhotos() -> Observable<[Photo]>", "parameterSignature": "", "parameterSignatureWithoutNames": "", "inputTypes": "", "isThrowing": false, "isInit": false, "isOverriding": false, "hasClosureParams": false, "@type": "ProtocolMethod", "accessibility": "", "parameterNames": "", "call": "", "parameters": [], "returnType": "Observable<[Photo]>", "isOptional": false, "stubFunction": "Cuckoo.ProtocolStubFunction"]
     func fetchPhotos()  -> Observable<[Photo]> {
        
            return cuckoo_manager.call("fetchPhotos() -> Observable<[Photo]>",
                parameters: (),
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    )
        
    }
    

	struct __StubbingProxy_APIService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchPhotos() -> Cuckoo.ProtocolStubFunction<(), Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockAPIService.self, method: "fetchPhotos() -> Observable<[Photo]>", parameterMatchers: matchers))
	    }
	    
	}

	struct __VerificationProxy_APIService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchPhotos() -> Cuckoo.__DoNotUse<Observable<[Photo]>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("fetchPhotos() -> Observable<[Photo]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}

}

 class APIServiceStub: APIService {
    

    

    
     func fetchPhotos()  -> Observable<[Photo]> {
        return DefaultValueRegistry.defaultValue(for: Observable<[Photo]>.self)
    }
    
}

