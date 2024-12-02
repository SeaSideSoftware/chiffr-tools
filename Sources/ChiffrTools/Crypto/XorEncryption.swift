import os.log
import Foundation

/// Encrypts a message using XOR with the provided cipher key.
func xorEncrypt(messageBytes: [UInt8], cipherBytes: Data) -> [UInt8] {
    guard messageBytes.count == cipherBytes.count else {
        os_log("Length of message and key are mismatched")
        return []
    }
    return zip(cipherBytes, messageBytes).map(^)
}

/// Decrypts a message using XOR with the provided cipher key.
func xorDecrypt(xoredBytes: [UInt8], cipherbytes: Data) -> [UInt8] {
    guard xoredBytes.count == cipherbytes.count else {
        os_log("Length of message and key are mismatched")
        return []
    }
    return zip(xoredBytes, cipherbytes).map(^)
}

