
class Log {
    
    private static var loggers: [Logger] = [ConsoleLogger()]
    
    class func debug(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.debug(message, context: context) })
    }
    
    class func warn(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.warn(message, context: context) })
    }
    
    class func error(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.error(message, context: context, userInfo: userInfo) })
    }
    
    class func severe(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.severe(message, context: context, userInfo: userInfo) })
    }
}
