import Foundation

extension Data {
    /// Generates secure random data of the specified length.
    static func secureRandomData(length: Int) -> [UInt8] {
        return (0 ..< length).map { _ in UInt8.random(in: UInt8.min ... UInt8.max) }
    }
}

