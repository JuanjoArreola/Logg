# A logging framework for swift

![Cocoapods](https://img.shields.io/cocoapods/v/Logg.svg)
![Platform](https://img.shields.io/cocoapods/p/Logg.svg)
![License](https://img.shields.io/cocoapods/l/Logg.svg)

## Usage

```swift
Log.debug("Current loggers: \(Log.loggers)")
Log.warn("Using formatter: \(Log.loggers.first!.formatter)")
Log.error(TestError.invalid)
Log.severe("some error")
```
###### Prints:
```
04-21 13:04:30.040 LoggTests.swift testFileLogger() [14] ℹ️ Debug: Current loggers: [Logg.ConsoleLogger]
04-21 13:04:30.041 LoggTests.swift testFileLogger() [15] ⚠️ Warning: Using formatter: Logg.DefaultFormatter
04-21 13:04:30.041 LoggTests.swift testFileLogger() [16] ❗ Error: invalid
04-21 13:04:30.041 LoggTests.swift testFileLogger() [17] ‼️ Severe: some error
```

## Configuration

`Log` is the class that dispatch the messages to all the loggers, you can configure this loggers modifying the loggers static property:

```swift
if debug {
  Log.loggers = [ConsoleLogger()]
} else {
  Log.loggers = [CustomLogger(level: [.error, .severe])]
}
```

Each logger has a property named level that you can customize:

```swift
let consoleLogger = Log.loggers.first
consoleLogger?.level = [.debug, .warning]
```

The level is an `OptionSet` with 4 basic values: `debug`, `warning`, `error`, `severe` and additionally `all` and `none`

## Logger

You can create and register your own loggers, just implement the `Logger` protocol and add an instance to the `loggers` static property of the `Log` class. The `Logger` protocol defines a couple of properties, `level` and `formatter`, and four functions: `debug, warn, error` and `severe` that correspond to the log levels

## Formatter

You can create your own formatter and use it with the loggers you want, just create a class that implements the `Formatter` protocol and assign it to the logger

```swift
let consoleLogger = Log.loggers.first
consoleLogger?.formatter = CustomFormatter()
```
