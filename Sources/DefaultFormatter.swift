import Foundation

open class DefaultFormatter: Formatter {
    
    public static var shared = DefaultFormatter()
    
    var formatter: DateFormatter
    
    init() {
        formatter = DateFormatter()
        formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    }
    
    open func format(_ message: @autoclosure () -> Any, level: Log.Level, context: LogContext) -> String {
        return string(from: context) + " \(string(from: level)): \(String(describing: message()))"
    }
    
    func string(from context: LogContext) -> String {
        let date = formatter.string(from: context.date)
        let file = context.file.components(separatedBy: "/").last ?? ""
        return "\(date) \(file) \(context.function) [\(context.line)]"
    }
    
    func string(from level: Log.Level) -> String {
        switch level {
        case Log.Level.debug: return "Debug"
        case Log.Level.warning: return "Warning"
        case Log.Level.error: return "Error"
        case Log.Level.severe: return "Severe"
        default:
            return ""
        }
    }
    
}
