import CryptoKit

/// Converts a byte array into a hexadecimal string.
public func hexadecimalHash(cipher: [UInt8]) -> String {
    let hashed = SHA256.hash(data: cipher)
    return hashed.compactMap { String(format: "%02x", $0) }.joined()
}

