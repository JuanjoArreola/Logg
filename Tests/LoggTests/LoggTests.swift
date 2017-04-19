import XCTest
import Logg

class LoggTests: XCTestCase {
    
    override func setUp() {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        path = path?.appendingPathComponent("logg_test.log")
        Log.loggers = [try! FileLogger(path: path!)]
    }
    
    func testFileLogger() {
        Log.debug("write")
    }

    static var allTests = [
        ("testExample", testFileLogger),
    ]
}
