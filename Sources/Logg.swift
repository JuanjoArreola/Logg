import Foundation

public class Log {
    
    public struct Level: OptionSet {
        public let rawValue: Int
        
        public static let debug = Level(rawValue:  1 << 0)
        public static let warning = Level(rawValue:  1 << 1)
        public static let error = Level(rawValue:  1 << 2)
        public static let severe = Level(rawValue:  1 << 3)
        
        public static let all: Level = [.debug, .warning, .error, .severe]
        public static let none: Level = []
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    public static var loggers: [Logger] = [ConsoleLogger()]
    
    public class func debug(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.debug(message, context: context) })
    }
    
    public class func warn(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.warn(message, context: context) })
    }
    
    public class func error(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.error(message, context: context, userInfo: userInfo) })
    }
    
    public class func severe(_ message: @autoclosure () -> Any, file: String = #file, function: StaticString = #function, line: Int = #line, userInfo: [String: Any]? = nil) {
        let context = LogContext(file: file, function: function.description, line: line)
        loggers.forEach({ $0.severe(message, context: context, userInfo: userInfo) })
    }
}
