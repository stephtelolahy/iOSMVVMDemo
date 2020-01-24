// MARK: - Mocks generated from file: iOSMVVMDemo/data/IDataManager.swift at 2020-01-24 12:58:45 +0000

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

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: IDataManager?

     func enableDefaultImplementation(_ stub: IDataManager) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func search(text: String) -> Observable<[Photo]> {
        
    return cuckoo_manager.call("search(text: String) -> Observable<[Photo]>",
            parameters: (text),
            escapingParameters: (text),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.search(text: text))
        
    }
    

	 struct __StubbingProxy_IDataManager: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func search<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<[Photo]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockIDataManager.self, method: "search(text: String) -> Observable<[Photo]>", parameterMatchers: matchers))
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
	    func search<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<(String), Observable<[Photo]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return cuckoo_manager.verify("search(text: String) -> Observable<[Photo]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class IDataManagerStub: IDataManager {
    

    

    
     func search(text: String) -> Observable<[Photo]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Photo]>).self)
    }
    
}


// MARK: - Mocks generated from file: iOSMVVMDemo/data/api/APIService.swift at 2020-01-24 12:58:45 +0000

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

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: APIService?

     func enableDefaultImplementation(_ stub: APIService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func search(text: String) -> Observable<[Photo]> {
        
    return cuckoo_manager.call("search(text: String) -> Observable<[Photo]>",
            parameters: (text),
            escapingParameters: (text),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.search(text: text))
        
    }
    

	 struct __StubbingProxy_APIService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func search<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<[Photo]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAPIService.self, method: "search(text: String) -> Observable<[Photo]>", parameterMatchers: matchers))
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
	    func search<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<(String), Observable<[Photo]>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return cuckoo_manager.verify("search(text: String) -> Observable<[Photo]>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class APIServiceStub: APIService {
    

    

    
     func search(text: String) -> Observable<[Photo]>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<[Photo]>).self)
    }
    
}


// MARK: - Mocks generated from file: iOSMVVMDemo/presentation-mvp/PhotosPresenter.swift at 2020-01-24 12:58:45 +0000

//
//  PhotosPresenter.swift
//  iOSMVVMDemo
//
//  Created by Hugues Stéphano TELOLAHY on 11/10/18.
//  Copyright © 2018 Hugues Stéphano TELOLAHY. All rights reserved.

import Cuckoo
@testable import iOSMVVMDemo

import RxSwift


 class MockPhotosView: PhotosView, Cuckoo.ProtocolMock {
    
     typealias MocksType = PhotosView
    
     typealias Stubbing = __StubbingProxy_PhotosView
     typealias Verification = __VerificationProxy_PhotosView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PhotosView?

     func enableDefaultImplementation(_ stub: PhotosView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func fill(photos: [Photo])  {
        
    return cuckoo_manager.call("fill(photos: [Photo])",
            parameters: (photos),
            escapingParameters: (photos),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fill(photos: photos))
        
    }
    
    
    
     func showError(_ error: Error)  {
        
    return cuckoo_manager.call("showError(_: Error)",
            parameters: (error),
            escapingParameters: (error),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showError(error))
        
    }
    
    
    
     func setLoadingVisible(_ visible: Bool)  {
        
    return cuckoo_manager.call("setLoadingVisible(_: Bool)",
            parameters: (visible),
            escapingParameters: (visible),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.setLoadingVisible(visible))
        
    }
    

	 struct __StubbingProxy_PhotosView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fill<M1: Cuckoo.Matchable>(photos: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([Photo])> where M1.MatchedType == [Photo] {
	        let matchers: [Cuckoo.ParameterMatcher<([Photo])>] = [wrap(matchable: photos) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosView.self, method: "fill(photos: [Photo])", parameterMatchers: matchers))
	    }
	    
	    func showError<M1: Cuckoo.Matchable>(_ error: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Error)> where M1.MatchedType == Error {
	        let matchers: [Cuckoo.ParameterMatcher<(Error)>] = [wrap(matchable: error) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosView.self, method: "showError(_: Error)", parameterMatchers: matchers))
	    }
	    
	    func setLoadingVisible<M1: Cuckoo.Matchable>(_ visible: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: visible) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosView.self, method: "setLoadingVisible(_: Bool)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PhotosView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fill<M1: Cuckoo.Matchable>(photos: M1) -> Cuckoo.__DoNotUse<([Photo]), Void> where M1.MatchedType == [Photo] {
	        let matchers: [Cuckoo.ParameterMatcher<([Photo])>] = [wrap(matchable: photos) { $0 }]
	        return cuckoo_manager.verify("fill(photos: [Photo])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func showError<M1: Cuckoo.Matchable>(_ error: M1) -> Cuckoo.__DoNotUse<(Error), Void> where M1.MatchedType == Error {
	        let matchers: [Cuckoo.ParameterMatcher<(Error)>] = [wrap(matchable: error) { $0 }]
	        return cuckoo_manager.verify("showError(_: Error)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func setLoadingVisible<M1: Cuckoo.Matchable>(_ visible: M1) -> Cuckoo.__DoNotUse<(Bool), Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: visible) { $0 }]
	        return cuckoo_manager.verify("setLoadingVisible(_: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PhotosViewStub: PhotosView {
    

    

    
     func fill(photos: [Photo])   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func showError(_ error: Error)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func setLoadingVisible(_ visible: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockPhotosPresenter: PhotosPresenter, Cuckoo.ClassMock {
    
     typealias MocksType = PhotosPresenter
    
     typealias Stubbing = __StubbingProxy_PhotosPresenter
     typealias Verification = __VerificationProxy_PhotosPresenter

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: PhotosPresenter?

     func enableDefaultImplementation(_ stub: PhotosPresenter) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func onSearch(text: String)  {
        
    return cuckoo_manager.call("onSearch(text: String)",
            parameters: (text),
            escapingParameters: (text),
            superclassCall:
                
                super.onSearch(text: text)
                ,
            defaultCall: __defaultImplStub!.onSearch(text: text))
        
    }
    

	 struct __StubbingProxy_PhotosPresenter: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func onSearch<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.ClassStubNoReturnFunction<(String)> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPhotosPresenter.self, method: "onSearch(text: String)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PhotosPresenter: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func onSearch<M1: Cuckoo.Matchable>(text: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: text) { $0 }]
	        return cuckoo_manager.verify("onSearch(text: String)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PhotosPresenterStub: PhotosPresenter {
    

    

    
     override func onSearch(text: String)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

