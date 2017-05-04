import Foundation

public struct LogContext {
    public var file: String
    public var function: String
    public var line: Int
    public var date = Date()
    
    init(file: String, function: String, line: Int) {
        self.file = file
        self.function = function
        self.line = line
    }
}
