import Foundation

public class CompositeLogger {
    
    public convenience init() {
        self.init(loggers: [ConsoleLogger()])
    }
    
    public required init(loggers: [Logger]) {
        self.loggers = loggers
    }
    
    public var level: LogLevel {
        get {
            return loggers.reduce(LogLevel.none, { $0.union($1.level) })
        } set {
            loggers.forEach({ $0.level = newValue })
        }
    }
    
    public var loggers: [Logger]
    
    public func debug(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.debug(message(), context: context) })
    }
    
    public func warn(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.warn(message(), context: context) })
    }
    
    public func error(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.error(message(), context: context, userInfo: userInfo) })
    }
    
    public func severe(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.severe(message(), context: context, userInfo: userInfo) })
    }
}
