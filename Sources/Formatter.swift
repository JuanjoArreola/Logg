import Foundation

public protocol Formatter {
    
    func format(_ message: @autoclosure () -> Any, level: Log.Level, context: LogContext) -> String
    
}
