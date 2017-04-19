import Foundation

public protocol Logger {
    
    var levels: [LogLevel] { get set }
    var formatter: Formatter { get set }
    
    func debug(_ message: @autoclosure () -> Any, context: LogContext)
    func warn(_ message: @autoclosure () -> Any, context: LogContext)
    func error(_ message: @autoclosure () -> Any, context: LogContext, userInfo: [String: Any]?)
    func severe(_ message: @autoclosure () -> Any, context: LogContext, userInfo: [String: Any]?)
}
