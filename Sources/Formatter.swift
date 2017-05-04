import Foundation

public protocol Formatter {
    
    func format(_ message: @autoclosure () -> Any, level: LogLevel, context: LogContext) -> String
    
}
