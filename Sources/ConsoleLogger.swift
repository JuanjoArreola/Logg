import Foundation

public class ConsoleLogger: Logger {
    
    public var levels: [LogLevel] = []
    public var formatter: Formatter
    
    init() {
        self.formatter = DefaultFormatter.shared
    }
    
    init(formatter: Formatter) {
        self.formatter = formatter
    }
    
    public func debug(_ message: @autoclosure () -> Any, context: LogContext) {
        if levels.contains(.debug) {
            print(formatter.format(message, level: .debug, context: context))
        }
    }
    
    public func warn(_ message: @autoclosure () -> Any, context: LogContext) {
        if levels.contains(.warning) {
            print(formatter.format(message, level: .warning, context: context))
        }
    }
    
    public func error(_ message: @autoclosure () -> Any, context: LogContext, userInfo: [String : Any]? = nil) {
        if levels.contains(.error) {
            print(formatter.format(message, level: .error, context: context))
        }
    }
    
    public func severe(_ message: @autoclosure () -> Any, context: LogContext, userInfo: [String : Any]? = nil) {
        if levels.contains(.severe) {
            print(formatter.format(message, level: .severe, context: context))
        }
    }
}
