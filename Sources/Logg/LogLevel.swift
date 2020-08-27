import Foundation

public struct LogLevel: OptionSet {
    public let rawValue: Int
    
    public static let debug = LogLevel(rawValue:  1 << 0)
    public static let info = LogLevel(rawValue:  1 << 1)
    public static let error = LogLevel(rawValue:  1 << 2)
    public static let fault = LogLevel(rawValue:  1 << 3)
    
    public static let all: LogLevel = [.debug, .info, .error, .fault]
    public static let none: LogLevel = []
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
