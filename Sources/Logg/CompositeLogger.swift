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
    
    public func info(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.info(message(), context: context, userInfo: userInfo) })
    }
    
    public func debug(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.debug(message(), context: context, userInfo: userInfo) })
    }
    
    public func error(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.error(message(), context: context, userInfo: userInfo) })
    }
    
    public func fault(_ message: @autoclosure () -> Any?, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.fault(message(), context: context, userInfo: userInfo) })
    }
}
