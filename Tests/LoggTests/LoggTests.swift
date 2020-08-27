import XCTest
import Logg

class LoggTests: XCTestCase {
    
    var log = CompositeLogger()
    
    override func setUp() {
        var path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        path = path?.appendingPathComponent("logg_test.log")
        log.loggers = [try! FileLogger(path: path!)]
    }
    
    func testFileLogger() {
        log.debug("Current loggers: \(log.loggers)")
        log.info("Using formatter: \(log.loggers.first!.formatter)")
        log.error(TestError.invalid)
        log.fault("some error")
    }
    
    func testFormatter() {
        let logger = log.loggers.first
        logger?.formatter = CustomFormatter()
        log.fault("some error")
    }

    static var allTests = [
        ("testExample", testFileLogger),
    ]
}

enum TestError: Error {
    case invalid
}

class CustomFormatter: LogFormatter {
    func format(_ message: @autoclosure () -> Any?, level: LogLevel, context: LogContext) -> String {
        return message() == nil ? String(describing: message()) : String(describing: message()!)
    }
}
