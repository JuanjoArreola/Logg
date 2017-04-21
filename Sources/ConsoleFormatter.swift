import Foundation

class ConsoleFormatter: DefaultFormatter {
    
    override func string(from level: Log.Level) -> String {
        switch level {
        case Log.Level.debug: return "ℹ️ Debug"
        case Log.Level.warning: return "⚠️ Warning"
        case Log.Level.error: return "❗ Error"
        case Log.Level.severe: return "‼️ Severe"
        default:
            return ""
        }
    }
}
