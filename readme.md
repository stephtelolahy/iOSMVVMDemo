# iOS MVVM Architecture

A basic iOS project aimed to be easy to maintain

**Keywords: Model-View-ViewModel + RX + Tests**

### Done
* Dependency injection pattern
* APIService with Alamofire + Codable
* ViewModel with PublishSubject
* ViewModelTest with Cuckoo + RxTest
* APIService implementation using local datasource

### TODO
* NetworkLayerTest with Quick, Nimble
* Swift lint (prevent force unwrap)
* Save preferred photos -> Home: [All][Starred]

### References
* [Lorem Picsum](https://picsum.photos)
* [Memory management in RXSwift](http://adamborek.com/memory-managment-rxswift/)
* [RXSwift subjects](https://medium.com/@dkhuong291/rxswift-subjects-part1-publishsubjects-103ff6b06932)
* [Cuckoo](https://github.com/Brightify/Cuckoo)
* [Staying Sane with Cuckoo and Code Generation](http://www.thecodedself.com/cuckoo-and-code-generation/)
* [Swift lint](https://github.com/realm/SwiftLint)
* [RxTest](https://cocoapods.org/pods/RxTest)