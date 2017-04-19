import Foundation

public protocol Formatter {
    
    func format(_ message: @autoclosure () -> Any, level: Log.Level, context: LogContext) -> String
    
}

public struct LogContext {
    var file: String
    var function: String
    var line: Int
    var date = Date()
    
    init(file: String, function: String, line: Int) {
        self.file = file
        self.function = function
        self.line = line
    }
}
