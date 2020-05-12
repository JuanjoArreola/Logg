import Foundation

private let logQueue = DispatchQueue(label: "com.logg.FileQueue", attributes: [])

public enum FileLoggerError: Error {
    case invalidFile
    case encodingError
}

public class FileLogger: Logger {
    
    public var formatter: LogFormatter
    public var level: LogLevel = .all
    public let file: URL
    public var fallbackLogger: Logger?
    
    public required init(formatter: LogFormatter, path: URL) throws {
        if !path.isFileURL {
            throw FileLoggerError.invalidFile
        }
        var isDirectory: ObjCBool = false
        if !FileManager.default.fileExists(atPath: path.path, isDirectory: &isDirectory) {
            FileManager.default.createFile(atPath: path.path, contents: nil, attributes: nil)
        } else if isDirectory.boolValue {
            throw FileLoggerError.invalidFile
        }
        self.formatter = formatter
        self.file = path
    }
    
    public convenience init(path: URL) throws {
        try self.init(formatter: DefaultFormatter.shared, path: path)
    }
    
    public func debug(_ message: @autoclosure () -> Any?, context: LogContext) {
        log(message(), context: context, level: .debug)
    }
    
    public func warn(_ message: @autoclosure () -> Any?, context: LogContext) {
        log(message(), context: context, level: .warning)
    }
    
    public func error(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String : Any]?) {
        log(message(), context: context, level: .error)
    }
    
    public func severe(_ message: @autoclosure () -> Any?, context: LogContext, userInfo: [String : Any]?) {
        log(message(), context: context, level: .severe)
    }
    
    private func log(_ message: @autoclosure () -> Any?, context: LogContext, level: LogLevel) {
        if !self.level.contains(level) { return }
        let string = formatter.format(message(), level: level, context: context) + "\n"
        let object = message()
        logQueue.async {
            do {
                try self.append(string: string)
            } catch {
                self.fallback(error: error)
                self.fallbackLogger?.debug(object, context: context)
            }
        }
    }
    
    private func append(string: String) throws {
        guard let data = string.data(using: String.Encoding.utf8) else {
            throw FileLoggerError.encodingError
        }
        try data.append(to: file)
    }
    
    private func fallback(error: Error, file: String = #file, function: StaticString = #function, line: Int = #line) {
        fallbackLogger?.error(error, context: LogContext(file: file, function: function.description, line: line), userInfo: nil)
    }
}

extension Data {
    
    func append(to file: URL) throws {
        let handle = try FileHandle(forWritingTo: file)
        defer {
            handle.closeFile()
        }
        handle.seekToEndOfFile()
        handle.write(self)
    }
}
