import XCTest
import Logg

class LoggTests: XCTestCase {
    
    var Log = LoggerContainer()
    
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
    
    func testFormatter() {
        var logger = Log.loggers.first
        logger?.formatter = CustomFormatter()
        Log.severe("some error")
    }

    static var allTests = [
        ("testExample", testFileLogger),
    ]
}

enum TestError: Error {
    case invalid
}

class CustomFormatter: Logg.Formatter {
    
    func format(_ message: @autoclosure () -> Any, level: LogLevel, context: LogContext) -> String {
        return String(describing: message())
    }
}
