import XCTest
import Logg

class LoggTests: XCTestCase {
    
    override func setUp() {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        path = path?.appendingPathComponent("logg_test.log")
        Log.loggers = [try! FileLogger(path: path!)]
    }
    
    func testFileLogger() {
        Log.debug("Current loggers: \(Log.loggers)")
        Log.warn("Using formatter: \(Log.loggers.first!.formatter)")
        Log.error(TestError.invalid)
        Log.severe("some error")
    }

    static var allTests = [
        ("testExample", testFileLogger),
    ]
}

enum TestError: Error {
    case invalid
}
