import os

/// Logs a message with the given log level.
func logMessage(_ message: String, level: OSLogType = .default) {
    os_log("%{public}@", log: OSLog.default, type: level, message)
}

