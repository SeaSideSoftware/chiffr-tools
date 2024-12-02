import CryptoKit
import UIKit

/// Generates a hash from a UIImage.
func imageHash(image: UIImage) -> [UInt8]? {
    if let data = image.pngData() {
        return Array(SHA256.hash(data: data))
    }
    return nil
}

/// Converts a byte array into a hexadecimal string.
func hexadecimalHash(cipher: [UInt8]) -> String {
    let hashed = SHA256.hash(data: cipher)
    return hashed.compactMap { String(format: "%02x", $0) }.joined()
}

