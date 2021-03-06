import Foundation

open class DefaultFormatter: LogFormatter {
    
    public static var shared = DefaultFormatter()
    
    public var formatter: DateFormatter
    
    public init() {
        formatter = DateFormatter()
        formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    }
    
    open func format(_ message: @autoclosure () -> Any?, level: LogLevel, context: LogContext) -> String {
        var description: String = "nil"
        if let instance = message() {
            description = String(describing: instance)
        }
        return string(from: context) + " \(string(from: level)): \(description)"
    }
    
    open func string(from context: LogContext) -> String {
        let date = formatter.string(from: context.date)
        let file = context.file.components(separatedBy: "/").last ?? ""
        return "\(date) \(file) \(context.function) [\(context.line)]"
    }
    
    open func string(from level: LogLevel) -> String {
        switch level {
        case LogLevel.info: return "Info"
        case LogLevel.debug: return "Debug"
        case LogLevel.error: return "Error"
        case LogLevel.fault: return "Fault"
        default:
            return ""
        }
    }
    
}
