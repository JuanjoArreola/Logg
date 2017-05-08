import Foundation

public protocol LogFormatter {
    
    func format(_ message: @autoclosure () -> Any, level: LogLevel, context: LogContext) -> String
    
}
