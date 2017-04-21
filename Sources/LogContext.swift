import Foundation

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
