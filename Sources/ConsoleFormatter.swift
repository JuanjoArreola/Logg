import Foundation

class ConsoleFormatter: DefaultFormatter {
    
    override func string(from level: LogLevel) -> String {
        switch level {
        case LogLevel.debug: return "ℹ️ Debug"
        case LogLevel.warning: return "⚠️ Warning"
        case LogLevel.error: return "❗ Error"
        case LogLevel.severe: return "‼️ Severe"
        default:
            return ""
        }
    }
}
