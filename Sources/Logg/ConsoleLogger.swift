import Foundation

private let logQueue = DispatchQueue(label: "com.logg.ConsoleQueue", attributes: [])

public class ConsoleLogger: Logger {
    
    public var level: LogLevel = .all
    public var formatter: LogFormatter
    
    public required init(formatter: LogFormatter, level: LogLevel) {
        self.formatter = formatter
        self.level = level
    }
    
    public convenience init() {
        self.init(formatter: ConsoleFormatter(), level: .all)
    }
    
    public func info(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String : Any]? = nil) {
        log(message(), context: context, level: .info)
    }
    
    public func debug(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String : Any]? = nil) {
        log(message(), context: context, level: .debug)
    }
    
    public func error(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String : Any]? = nil) {
        log(message(), context: context, level: .error)
    }
    
    public func fault(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String : Any]? = nil) {
        log(message(), context: context, level: .fault)
    }
    
    private func log(_ message: @autoclosure () -> Any?, context: LogContext, level: LogLevel) {
        guard self.level.contains(level) else { return }
        let string = formatter.format(message(), level: level, context: context)
        logQueue.async {
            print(string)
        }
    }
}
