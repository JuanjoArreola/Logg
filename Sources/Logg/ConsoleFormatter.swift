import Foundation

open class ConsoleFormatter: DefaultFormatter {
    
    override open func string(from level: LogLevel) -> String {
        switch level {
        case LogLevel.info: return "❕ Info"
        case LogLevel.debug: return "🐛 Debug"
        case LogLevel.error: return "❗ Error"
        case LogLevel.fault: return "‼️ Fault"
        default:
            return ""
        }
    }
}
