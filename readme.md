# iOS MVVM Architecture

A basic iOS project aimed to be easy to maintain

**Keywords: Model-View-ViewModel + RX + Tests**

### Done
* Dependency injection pattern
* APIService with Alamofire + Codable
* ViewModel with PublishSubject
* ViewModelTest with Cuckoo + RxTest

### TODO
* APIService implementation using local resource
* NetworkLayerTest with Quick, Nimble
* Swift lint (prevent force unwrap)
* Save preferred photos -> Home: [All][Starred]

### References
* [Lorem Picsum free photo API](https://picsum.photos)
* [Memory management in RXSwift](http://adamborek.com/memory-managment-rxswift/)
* [RXSwift subjects](https://medium.com/@dkhuong291/rxswift-subjects-part1-publishsubjects-103ff6b06932)
* [Cuckoo mocking library](https://github.com/Brightify/Cuckoo)
* [Swift lint](https://github.com/realm/SwiftLint)
* [RxTest](https://cocoapods.org/pods/RxTest)