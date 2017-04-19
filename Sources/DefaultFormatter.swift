import Foundation

class DefaultFormatter: Formatter {
    
    static var shared = DefaultFormatter()
    
    var formatter: DateFormatter
    
    init() {
        formatter = DateFormatter()
        formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    }
    
    func format(_ message: @autoclosure () -> Any, level: LogLevel, context: LogContext) -> String {
        return string(from: context) + "\(string(from: level)): \(String(describing: message))"
    }
    
    private func string(from context: LogContext) -> String {
        let date = formatter.string(from: context.date)
        let file = context.file.components(separatedBy: "/").last ?? ""
        return "\(date) \(file) \(context.function) [\(context.line)]"
    }
    
    private func string(from level: LogLevel) -> String {
        switch level {
        case .debug: return "Debug"
        case .warning: return "Warning"
        case .error: return "Error"
        case .severe: return "Severe"
        }
    }
}
