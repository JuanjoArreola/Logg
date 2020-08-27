import Foundation

public protocol Logger: class {
    
    var level: LogLevel { get set }
    var formatter: LogFormatter { get set }
    
    func info(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String: Any]?)
    func debug(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String: Any]?)
    func error(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String: Any]?)
    func fault(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String: Any]?)
}
