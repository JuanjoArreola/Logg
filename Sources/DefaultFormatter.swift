import Foundation

open class DefaultFormatter: Formatter {
    
    public static var shared = DefaultFormatter()
    
    var formatter: DateFormatter
    
    init() {
        formatter = DateFormatter()
        formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    }
    
    open func format(_ message: @autoclosure () -> Any, level: LogLevel, context: LogContext) -> String {
        return string(from: context) + " \(string(from: level)): \(String(describing: message()))"
    }
    
    func string(from context: LogContext) -> String {
        let date = formatter.string(from: context.date)
        let file = context.file.components(separatedBy: "/").last ?? ""
        return "\(date) \(file) \(context.function) [\(context.line)]"
    }
    
    func string(from level: LogLevel) -> String {
        switch level {
        case LogLevel.debug: return "Debug"
        case LogLevel.warning: return "Warning"
        case LogLevel.error: return "Error"
        case LogLevel.severe: return "Severe"
        default:
            return ""
        }
    }
    
}
