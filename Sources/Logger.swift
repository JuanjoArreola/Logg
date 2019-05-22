import Foundation

public protocol Logger: class {
    
    var level: LogLevel { get set }
    var formatter: LogFormatter { get set }
    
    func debug(_ message: @autoclosure () -> Any?, context: LogContext)
    func warn(_ message: @autoclosure () -> Any?, context: LogContext)
    func error(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String: Any]?)
    func severe(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String: Any]?)
}
