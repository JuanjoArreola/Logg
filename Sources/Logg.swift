import Foundation

public class LoggerContainer {
    
    public init() {
    }
    
    public var loggers: [Logger] = [ConsoleLogger()]
    
    public func debug(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.debug(message, context: context) })
    }
    
    public func warn(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.warn(message, context: context) })
    }
    
    public func error(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.error(message, context: context, userInfo: userInfo) })
    }
    
    public func severe(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.severe(message, context: context, userInfo: userInfo) })
    }
}
