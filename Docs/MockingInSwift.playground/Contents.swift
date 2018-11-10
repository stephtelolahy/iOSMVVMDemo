
import Foundation
import XCTest

/********************************************************************************
struct MusicService {
    let session: URLSession

    //MARK: - BastardInjection
    init() {
        self.session = URLSession.shared
    }

    //MARK: - Initializer
    init(session: URLSession) {
        self.session = session
    }
}
********************************************************************************/


/********************************************************************************
struct MusicService {
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func search(text: String) {
        let url = URL(string: "https://itunes.apple.com/search?term=\(text)")!
        let task = session.dataTask(with: url) { (data, _, _) -> Void in
            if let data = data,
                let string = String(data: data, encoding: String.Encoding.utf8) {
                print(string)
            }
        }
        task.resume()
    }
}

let service = MusicService(session: URLSession.shared)
service.search(text: "beyonce")
 ********************************************************************************/


protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}

struct MusicService {
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func search(text: String) {
        let url = URL(string: "https://itunes.apple.com/search?term=\(text)")!
        let task = session.dataTask(with: url) { (data, _, _) -> Void in
            if let data = data,
                let string = String(data: data, encoding: String.Encoding.utf8) {
                print(string)
            }
        }
        task.resume()
    }
}



// MARK: Test

class MockURLSession: URLSessionProtocol {
    var dataTaskCallCount = 0
    var lastURL: URL? = nil
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        lastURL = url
        return URLSessionDataTask()
    }
}

func testFetchMusic_ShouldMakeDataTaskForItunes() {
    let mockURLSession = MockURLSession()
    let service = MusicService(session: mockURLSession)
    service.search(text: "beyonce")
    
    XCTAssertEqual(mockURLSession.dataTaskCallCount, 1)
    XCTAssertEqual(mockURLSession.lastURL, URL(string: "https://itunes.apple.com/search?term=beyonce"))
}
