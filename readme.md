# iOS MVVM Architecture

A basic iOS project to be easy to maintain

**Keywords**
> Model-View-ViewModel + Dependency injectyion + RX + Tests + Multiple schemes

## Features
* Dependency injection pattern
* ViewModel with PublishSubject
* ViewModel test with Cuckoo + RxTest
* Remote APIService with Alamofire + Codable
* Local APIService with bundled Json files
* DataManager test with RXBlocking
* Multiple build configurations within single target
* Json<->Model mapping test with Mockingjay
* Search feature

## References
* [Memory management in RXSwift](http://adamborek.com/memory-managment-rxswift/)
* [RXSwift subjects](https://medium.com/@dkhuong291/rxswift-subjects-part1-publishsubjects-103ff6b06932)
* [Cuckoo](https://github.com/Brightify/Cuckoo)
* [Staying sane with Cuckoo and Code Generation](http://www.thecodedself.com/cuckoo-and-code-generation/)
* [Swift lint](https://github.com/realm/SwiftLint)
* [RxTest](https://cocoapods.org/pods/RxTest)
* [Manage multiple configuration and environments with Single target](https://medium.com/@kavithakumarasamy89/xcode-build-settings-user-defined-settings-manage-multiple-environments-with-single-target-3e5c1a307999)
* [Itunes API](https://affiliate.itunes.apple.com/resources/documentation/itunes-store-web-service-search-api/)
